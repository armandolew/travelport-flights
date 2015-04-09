require 'spec_helper'
require 'active_support/all'

describe Travelport::Flights::AirService do
  before :each do
    @air_service = Travelport::Flights::AirService.new(:url => "https://americas.universal-api.pp.travelport.com/B2BGateway/connect/uAPI/",
      :branch_code => "P0000000", :username => "Universal API/uAPI123456", :password => "123456")
  end

  describe "Initialization" do
    it "should initialize with url, branch code, username and password" do
      expect(@air_service.url).to eql "https://americas.universal-api.pp.travelport.com/B2BGateway/connect/uAPI/AirService"
      expect(@air_service.branch_code).to eql "P0000000"
      expect(@air_service.username).to eql "Universal API/uAPI123456"
      expect(@air_service.password).to eql "123456"
    end
  end

  describe "Travelport constants" do
    it "should have a path to the soap service" do
      expect(Travelport::Flights::AirService::SOAP_PATH).to eql "AirService"
    end
  end

  describe "low fare search" do
    it "should render a request to the low fare search" do
      travel_date = 1.day.from_now
      return_date = 5.days.from_now
      request = @air_service.render_round_trip_template("CUU", "MEX", travel_date, return_date)
      expect(request).to_not eql nil
      expect(request).to include("soapenv:Envelope", "CUU", "MEX", travel_date.strftime("%Y-%m-%d"))
    end

    it "should render a request to the one way low fare search" do
      travel_date = 1.day.from_now
      return_date = 5.days.from_now
      request = @air_service.render_one_way_template("CUU", "MEX", travel_date)
      expect(request).to_not eql nil
      expect(request).to include("soapenv:Envelope", "CUU", "MEX", travel_date.strftime("%Y-%m-%d"))
      expect(request).to_not include(return_date.strftime("%Y-%m-%d"))
    end

    it "should render a request to the one way low fare search with fake data" do
      @air_service = Travelport::Flights::AirService.new(:url => "https://americas.universal-api.pp.travelport.com/B2BGateway/connect/uAPI/",
        :branch_code => "P0000000", :username => "Universal API/uAPI123456", :password => "123456", :fake => true)
      travel_date = 1.day.from_now
      response = @air_service.low_fare_search_one_way("CUU", "MEX", travel_date )
      air_segments = response[0]
      expect(air_segments).to_not eql nil
      expect(air_segments).to_not be_empty
    end

    it "should make an http request to the service" do
      travel_date = 1.day.from_now
      return_date = 5.days.from_now
      request = @air_service.render_round_trip_template("CUU", "MEX", travel_date, return_date)
      response = @air_service.call_service(request)
      expect(response).to_not eql nil
      expect(response.body).to_not eql nil
      expect(response.code).to eql 401
    end

    it "should parse a response from Travelport and turn it into an AirSegment object" do
      travel_date = 1.day.from_now
      return_date = 5.days.from_now
      response = @air_service.low_fare_search("CUU", "MEX", travel_date, return_date)
      air_segments = response[0]
      expect(air_segments).to_not eql nil
      expect(air_segments).to be_empty
    end
  end
end
