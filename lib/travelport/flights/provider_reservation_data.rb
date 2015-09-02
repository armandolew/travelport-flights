require 'nokogiri'
require 'json'

module Travelport
  module Flights
	class ProviderReservationData

		attr_accessor :pnr, :airline_confirmation, :creation_date_pnr, :creation

	        def self.create_from_node(node, air_segments)
			
	        end

		def self.create_from_xml(xml)
			doc = Nokogiri::XML(xml)
			results = doc.xpath('//universal:AirCreateReservationRsp/universal:UniversalRecord', 'universal' => 'http://www.travelport.com/schema/universal_v31_0')
			
			puts "PNR: " + results.xpath("@LocatorCode").to_s
			
			result_airline = doc.xpath('//universal:AirCreateReservationRsp/universal:UniversalRecord/universal:ProviderReservationInfo', 'universal' => 'http://www.travelport.com/schema/universal_v31_0')

			puts "Airline Code: " + result_airline.xpath("@LocatorCode").to_s

			return "YT2EX3"
 		end
	end
  end	
end
