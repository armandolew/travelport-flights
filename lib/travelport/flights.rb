require "travelport/flights/version"
require "travelport/flights/templates"
require "travelport/flights/test_data"
require "travelport/flights/air_segment"
require "travelport/flights/air_pricing_solution"
require "travelport/flights/provider_reservation_data"
require "erb"
require "ostruct"
require 'httparty'

module Travelport
  module Flights
    class AirService

      attr_accessor :url, :branch_code, :username, :password, :fake

      def initialize(options = {})
        @url = options[:url] + options[:soap_path]
        @branch_code = options[:branch_code]
        @username = options[:username]
        @password = options[:password]
        @fake = options[:fake].nil? ? false : options[:fake]
      end

      def low_fare_search(origin, destination, travel_date, return_date)
        request_body = render_round_trip_template(origin, destination, travel_date, return_date)
        response = call_service(request_body)
        air_segments = Travelport::Flights::AirSegment.create_from_xml(response.body)
        air_pricing_solution_lists = Travelport::Flights::AirPricingSolution.create_from_xml(response.body, air_segments)
        return [ air_segments, air_pricing_solution_lists]
      end

      def low_fare_search_one_way(origin, destination, travel_date)
        if @fake
          air_segments = Travelport::Flights::AirSegment.create_from_xml(TEST_ONE_WAY_RESPONSE_DATA)
          air_pricing_solution_lists = Travelport::Flights::AirPricingSolution.create_from_xml(TEST_ONE_WAY_RESPONSE_DATA, air_segments)
          return [ air_segments, air_pricing_solution_lists]
        else
          request_body = render_one_way_template(origin, destination, travel_date)
          response = call_service(request_body)
          air_segments = Travelport::Flights::AirSegment.create_from_xml(response.body)
          air_pricing_solution_lists = Travelport::Flights::AirPricingSolution.create_from_xml(response.body, air_segments)
          return [ air_segments, air_pricing_solution_lists]
        end
      end

      ### ADDED TO CALL AIRCREATERESERVATIONRQ ###	
      #def pnr_generation(contactInfo, air_pricing_solution)
	#if @fake
	#   response_pnr = Travelport::Flights::ProviderReservationData.create_from_xml(TEST_PNR_RESPONSE_DATA)
	#   response = ["0","0"]
	#else
	#   request_body = render_provider_reservation_template(contactInfo, air_pricing_solution)	
	#   response_pnr = call_service(request_body)
	#   response = Travelport::Flights::ProviderReservationData.create_from_xml(response_pnr.body)
	#   if response.nil?
	#     response = ["0","0"]	
	#   end	
        #end
        #return response
      #end

      def pnr_generation(air_create_reservation)
	if @fake
		response = Travelport::Flights::ProviderReservationData.create_from_xml(TEST_PNR_RESPONSE_DATA)
	else
		request_body = render_provider_reservation_template(air_create_reservation)
		response_pnr = call_service(request_body)
		response = Travelport::Flights::ProviderReservationData.create_from_xml(response_pnr.body)
	end
        return response
      end	

      ### ADDED TO CALL AIRCREATERESERVATIONRQ ###


      def cancel_reservation(universal_record_id)
	request_body = render_cancelation_template(universal_record_id)
        response = call_service(request_body)
	return response
      end

      def render_round_trip_template(origin, destination, travel_date, return_date)
        travel_date = travel_date.strftime("%Y-%m-%d")
        return_date = return_date.strftime("%Y-%m-%d")
        namespace = OpenStruct.new(branch_code: @branch_code, origin: origin, destination: destination, travel_date: travel_date, return_date: return_date)
        template = ERB.new(Travelport::Flights::ROUND_TRIP_TEMPLATE)
        return  template.result(namespace.instance_eval {binding} )
      end

      def render_one_way_template(origin, destination, travel_date)
        travel_date = travel_date.strftime("%Y-%m-%d")
        namespace = OpenStruct.new(branch_code: @branch_code, origin: origin, destination: destination, travel_date: travel_date)
        template = ERB.new(Travelport::Flights::ONE_WAY_TEMPLATE)
        return  template.result(namespace.instance_eval {binding} )
      end

      ### ADDED TO CALL AIRCREATERESERVATIONRQ ###
      def render_provider_reservation_template(air_create_reservation)
	date = DateTime.now.strftime("%FT%T%:z")
	flight_key_var = air_create_reservation.air_segment.key
	approximate_base_price_var = air_create_reservation.air_price_solution.approximate_base_price
	approximate_total_price = air_create_reservation.air_price_solution.approximate_total_price
	base_price_var = air_create_reservation.air_price_solution.base_price
	total_price_var = air_create_reservation.air_price_solution.total_price
	taxes_var = air_create_reservation.air_price_solution.taxes
	flight_arrival_time_var = air_create_reservation.air_segment.arrival_time
	carrier_var = air_create_reservation.air_segment.carrier
	change_of_plane_var = air_create_reservation.air_segment.change_of_plane
	departure_var = air_create_reservation.air_segment.departure_time
	destination_var = air_create_reservation.air_segment.destination
	flight_number_var = air_create_reservation.air_segment.flight_number	
	group_var = air_create_reservation.air_segment.group
	origin_var = air_create_reservation.air_segment.origin
	participation_level_var = air_create_reservation.air_segment.participant_level

	namespace = OpenStruct.new(
		contactInfo_email: air_create_reservation.contactInfo.email,
		contactInfo_birthday: air_create_reservation.contactInfo.birthday,
		contactInfo_first_name: air_create_reservation.contactInfo.first_name,
		contactInfo_last_name: air_create_reservation.contactInfo.last_name,
		contactInfo_phone_number: air_create_reservation.contactInfo.phone_number,
		flight_key: flight_key_var,
		approximate_base_price: approximate_base_price_var,
		approximate_total_price: approximate_total_price,
		base_price: base_price_var,
		total_price: total_price_var,
		taxes: taxes_var,
		flight_arrival_time: flight_arrival_time_var,
		carrier: carrier_var,
		change_of_plane: change_of_plane_var,
		departure_time: departure_var,
		destination: destination_var,
		flight_number: flight_number_var,
		group: group_var,
		origin: origin_var,
		participant_level: participation_level_var,
		latest_ticketing_time: date,
		effective_date: date,
		ticket_date: departure_var
	)
	template = ERB.new(Travelport::Flights::PNR_REQ_TEMPLATE)
	return  template.result(namespace.instance_eval {binding} )
      end	
      ### ADDED TO CALL AIRCREATERESERVATIONRQ ###	

      def render_cancelation_template(universal_reservation_id)
	namespace = OpenStruct.new(
			universal_record: universal_reservation_id,
			target_branch: "P7025995"
		    )
        template = ERB.new(Travelport::Flights::PNR_CANCEL_TEMPLATE)
        return template.result(namespace.instance_eval {binding})
      end	

      def call_service(body)
        auth = { username: @username, password: @password }
        $stdout.puts(body)
        response = HTTParty.post(@url, basic_auth: auth, body: body, headers: { 'Content-Type' => 'application/json' }, timeout: 120 )
        $stdout.puts(response.body)
        response
      end
    end
  end
end
