require "travelport/flights/air_segment"
module Travelport
  module Flights
    class AirPricingSolution
      @@finder = Proc.new {|key| next nil }

      attr_accessor :flight_infos, :total_price, :taxes, :key, :approximate_base_price,
        :approximate_total_price, :base_price, :equivalent_base_price, :currency_type, :latest_ticketing_time, :fare_info_key, 
	:unique_id, :original_xml

      def initialize
        self.currency_type = "MXN"
      end

      def self.finder=(finder)
        @@finder = finder
      end

      def self.finder
        @@finder
      end

      def self.create_from_string(air_pricing_xml, finder)
        AirPricingSolution.finder = finder
        doc = Nokogiri::XML(air_pricing_xml)
        air_node = doc.xpath('//air:AirPricingSolution', 'air' => 'http://www.travelport.com/schema/air_v25_0').first
        AirPricingSolution.create_from_node(air_node, {})
      end

      def self.create_from_node(node, air_segments)
        air_pricing_solution = Travelport::Flights::AirPricingSolution.new
        air_pricing_solution.key = node['Key']
        air_pricing_solution.approximate_base_price = node['ApproximateBasePrice'].delete(air_pricing_solution.currency_type)
        air_pricing_solution.approximate_total_price = node['ApproximateTotalPrice'].delete(air_pricing_solution.currency_type)
        air_pricing_solution.base_price = node['BasePrice'].delete(air_pricing_solution.currency_type)
        air_pricing_solution.total_price = node['TotalPrice'].delete(air_pricing_solution.currency_type)
        air_pricing_solution.taxes = node['Taxes'].delete(air_pricing_solution.currency_type)
	air_pricing_solution.latest_ticketing_time = node['LatestTicketingTime']
	air_pricing_solution.fare_info_key = node['FareInfoRef']

        unless node['EquivalentBasePrice'].nil?
          air_pricing_solution.equivalent_base_price = node['EquivalentBasePrice'].delete(air_pricing_solution.currency_type)
        end
        air_pricing_solution.flight_infos = []
        segment_refs = node.xpath('air:Journey/air:AirSegmentRef', 'air' => 'http://www.travelport.com/schema/air_v25_0')
        segment_refs.each do |segment_ref|
          puts "Buscando segmento#{segment_ref['Key']}"
          if AirPricingSolution.finder.call(segment_ref['Key']).nil?
            flight_info = air_segments[segment_ref['Key']]
            air_pricing_solution.flight_infos << flight_info
          else
            puts "Buscando en finder"
            air_pricing_solution.flight_infos << AirPricingSolution.finder.call(segment_ref['Key'])
          end
        end
        air_pricing_solution
      end

      def self.create_from_xml(xml, air_segments_hash)
        doc = Nokogiri::XML(xml)
        results = doc.xpath('//air:AirPricingSolution', 'air' => 'http://www.travelport.com/schema/air_v25_0')
        air_solutions = []
        results.each do |result|
          air_solution = AirPricingSolution.create_from_node(result, air_segments_hash)
          air_solution.original_xml  = '<air:LowFareSearchRsp  xmlns:air="http://www.travelport.com/schema/air_v25_0">' +
          result.to_s + '</air:LowFareSearchRsp>'
          air_solution.unique_id = air_solution.key
          air_solutions << air_solution
        end
        air_solutions
      end

      def departure_flight_infos
        self.flight_infos.select{ |flight_info| flight_info.group == "0" }
      end

      def return_flight_infos
        self.flight_infos.select{ |flight_info| flight_info.group == "1" }
      end

      def total_price_to_integer
        total_price.to_i + 100 #This should be a config setting or database data
      end

      def is_international?
        origin = departure_flight_infos.first.origin_airport
        destination = departure_flight_infos.last.destination_airport
        return origin.country != destination.country
      end
    end
  end
end
