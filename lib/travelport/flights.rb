require "travelport/flights/version"
require "travelport/flights/templates"
require "travelport/flights/test_data"
require "travelport/flights/air_segment"
require "travelport/flights/air_pricing_solution"
require "erb"
require "ostruct"
require 'httparty'

module Travelport
  module Flights
    class AirService

      attr_accessor :url, :branch_code, :username, :password, :fake

      SOAP_PATH = "AirService"

      def initialize(options = {})
        @url = options[:url] + SOAP_PATH
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
