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
			universal_record = doc.xpath('//universal:AirCreateReservationRsp/universal:UniversalRecord', 'universal' => 'http://www.travelport.com/schema/universal_v31_0')
			pnr_record = doc.xpath('//universal:AirCreateReservationRsp/universal:UniversalRecord/universal:ProviderReservationInfo', 'universal' => 'http://www.travelport.com/schema/universal_v31_0')
			air_reservation_record = doc.xpath('//universal:AirCreateReservationRsp/universal:UniversalRecord/air:AirReservation', 'universal' => 'http://www.travelport.com/schema/universal_v31_0', 'air' => 'http://www.travelport.com/schema/universal_v31_0')
			 
			universal_code	= universal_record.xpath("@LocatorCode").to_s #Si no, "0"
			pnr_code 	= pnr_record.xpath("@LocatorCode").to_s #Si no, "0"
			airline_code 	= air_reservation_record.xpath("@LocatorCode").to_s #Si no, "0"

			if universal_code.nil? or universal_code.eql? "" and 
			  empty_results = doc.xpath('//SOAP:Fault/faultstring/text()')	
			  message = empty_results.to_s 
			else
			  message = "OK"
			end

			@provider_reservation_response = ProviderReservationResponse.new(pnr_code, universal_code, airline_code, message)

			return @provider_reservation_response
 		end
	end
  end	
end
