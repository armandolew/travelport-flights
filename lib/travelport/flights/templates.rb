module Travelport
  module Flights
    ONE_WAY_TEMPLATE = <<-template
      <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
        <soapenv:Header/>
        <soapenv:Body>
          <air:LowFareSearchReq xmlns:air="http://www.travelport.com/schema/air_v25_0" xmlns:com="http://www.travelport.com/schema/common_v25_0" AuthorizedBy="user" TargetBranch="<%= branch_code %>" TraceId="trace">
            <com:BillingPointOfSaleInfo OriginApplication="UAPI"/>
            <air:SearchAirLeg>
              <air:SearchOrigin>
                <com:CityOrAirport Code="<%= origin %>"/>
              </air:SearchOrigin>
              <air:SearchDestination>
                <com:CityOrAirport Code="<%= destination %>"/>
              </air:SearchDestination>
              <air:SearchDepTime PreferredTime="<%= travel_date %>"/>
            </air:SearchAirLeg>
            <air:AirSearchModifiers MaxSolutions="9" >
              <air:PreferredProviders>
                <com:Provider Code="1P"/>
              </air:PreferredProviders>
              <air:FlightType RequireSingleCarrier="true" MaxConnections="3" MaxStops="3"/>
            </air:AirSearchModifiers>
            <com:SearchPassenger Code="ADT"/>
            <air:AirPricingModifiers CurrencyType="MXN" />
          </air:LowFareSearchReq>
        </soapenv:Body>
      </soapenv:Envelope>
    template

    ROUND_TRIP_TEMPLATE = <<-template
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
      <soapenv:Header/>
      <soapenv:Body>
        <air:LowFareSearchReq xmlns:air="http://www.travelport.com/schema/air_v25_0" xmlns:com="http://www.travelport.com/schema/common_v25_0" AuthorizedBy="user" TargetBranch="<%= branch_code %>" TraceId="trace">
          <com:BillingPointOfSaleInfo OriginApplication="UAPI"/>
          <air:SearchAirLeg>
            <air:SearchOrigin>
              <com:CityOrAirport Code="<%= origin %>"/>
            </air:SearchOrigin>
            <air:SearchDestination>
              <com:CityOrAirport Code="<%= destination %>"/>
            </air:SearchDestination>
            <air:SearchDepTime PreferredTime="<%= travel_date %>"/>
          </air:SearchAirLeg>
          <air:SearchAirLeg>
            <air:SearchOrigin>
              <com:CityOrAirport Code="<%= destination %>"/>
            </air:SearchOrigin>
            <air:SearchDestination>
              <com:CityOrAirport Code="<%= origin %>"/>
            </air:SearchDestination>
            <air:SearchDepTime PreferredTime="<%= return_date %>"/>
          </air:SearchAirLeg>
          <air:AirSearchModifiers MaxSolutions="5">
            <air:PreferredProviders>
              <com:Provider Code="1P"/>
            </air:PreferredProviders>
            <air:FlightType RequireSingleCarrier="true" MaxConnections="3" MaxStops="3"/>
          </air:AirSearchModifiers>
          <com:SearchPassenger Code="ADT"/>
          <air:AirPricingModifiers CurrencyType="MXN" />
        </air:LowFareSearchReq>
      </soapenv:Body>
    </soapenv:Envelope>
    template

    AIR_PRICE_REQUEST_TEMPLATE = <<-template
      <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
      <soapenv:Header/>
        <soapenv:Body>
          <air:AirPriceReq xmlns:air="http://www.travelport.com/schema/air_v27_0" AuthorizedBy="user" TargetBranch="<%= branch_code %>" TraceId="trace">
            <com:BillingPointOfSaleInfo xmlns:com="http://www.travelport.com/schema/common_v27_0" OriginApplication="UAPI"/>
            <air:AirItinerary>
              <% air_pricing_solution.flight_infos.each do |air_segment| %>
                <%= air_segment.original_xml %>
              <% end %>
            </air:AirItinerary>
            <com:SearchPassenger xmlns:com="http://www.travelport.com/schema/common_v27_0" BookingTravelerRef="gr8AVWGCR064r57Jt0+8bA==" Code="ADT"/>
          <air:AirPricingCommand/>
          </air:AirPriceReq>
        </soapenv:Body>
      </soapenv:Envelope>
    template
  end
end
