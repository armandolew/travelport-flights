require 'nokogiri'

module Travelport
  module Flights
    class AirSegment
      attr_accessor :key, :group, :carrier, :flight_number, :origin, :destination, :departure_time, :arrival_time,
         :flight_time, :distance, :eticketability, :equipment, :change_of_plane, :participant_level, :optional_services_indicator,
         :availability_source, :original_xml, :unique_id, :origin_airport, :destination_airport


      def self.create_from_xml(xml)
        doc = Nokogiri::XML(xml)
        results = doc.xpath('//air:AirSegment', 'air' => 'http://www.travelport.com/schema/air_v25_0')
        air_segments = {}
        results.to_a.each do |air_segment_node|
          air_segment = AirSegment.create_from_node(air_segment_node)
          air_segment.unique_id = 'fi'+air_segment.key
          air_segments[air_segment.key] = air_segment
        end
        air_segments
      end

      def self.create_from_node(node)
          air_segment = AirSegment.new
          air_segment.key = node['Key']
          air_segment.group = node['Group']
          air_segment.carrier = node['Carrier']
          air_segment.flight_number = node['FlightNumber']
          air_segment.origin = node['Origin']
          air_segment.destination = node['Destination']
          air_segment.departure_time = DateTime.parse(node['DepartureTime'])
          air_segment.arrival_time = DateTime.parse(node['ArrivalTime'])
          air_segment.flight_time = node['FlightTime'].to_i
          air_segment.distance = node['Distance'].to_i
          air_segment.eticketability = node['ETicketability'] == 'Yes' ? true : false
          air_segment.equipment = node['Equipment']
          air_segment.change_of_plane = node['ChangeOfPlane'] == 'true' ? true : false
          air_segment.participant_level = node['ParticipantLevel']
          air_segment.optional_services_indicator = node['OptionalServicesIndicator']
          air_segment.availability_source = node['AvailabilitySource']
          air_segment.original_xml = node.to_s
          air_segment
      end
    end
  end
end
