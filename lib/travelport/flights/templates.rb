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

    PNR_REQ_TEMPLATE = <<-template
	<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
	  <soapenv:Header />
	  <soapenv:Body>
	    <univ:AirCreateReservationReq xmlns:univ="http://www.travelport.com/schema/universal_v31_0" AuthorizedBy="user" RetainReservation="Both" TargetBranch="P7025995" TraceId="trace">
	      <com:BillingPointOfSaleInfo xmlns:com="http://www.travelport.com/schema/common_v31_0" OriginApplication="UAPI" />
	      <com:BookingTraveler xmlns:com="http://www.travelport.com/schema/common_v31_0" DOB="<%= contactInfo_birthday %>" Gender="M" Key="gr8AVWGCR064r57Jt0+8bA==" TravelerType="ADT">
		<com:BookingTravelerName First="<%= contactInfo_first_name %>" Last="<%= contactInfo_last_name %>" Prefix="Mrs" />
		<com:DeliveryInfo>
		  <com:ShippingAddress>
		   </com:ShippingAddress>
		</com:DeliveryInfo>
		<com:PhoneNumber AreaCode="55" CountryCode="1" Location="MEX" Number="<%= contactInfo_phone_number %>" />
		<com:Email EmailID="<%= contactInfo_email %>" Type="Home" />
		<com:SSR Carrier="AM" FreeText="P/MX/F1234567/MX/07Nov81/M/23Mar16/<%= contactInfo_last_name %>/<%= contactInfo_first_name %>" SegmentRef="<%= flight_key %>" Status="HK" Type="DOCS" />
		<com:Address>
		</com:Address>
	      </com:BookingTraveler>
	      <com:FormOfPayment xmlns:com="http://www.travelport.com/schema/common_v31_0" Key="jwt2mcK1Qp27I2xfpcCtAw==" Type="Cash" />
	      <air:AirPricingSolution xmlns:air="http://www.travelport.com/schema/air_v31_0" ApproximateBasePrice="<%= approximate_base_price %>" ApproximateTotalPrice="<%= approximate_total_price %>" BasePrice="<%= base_price %>" EquivalentBasePrice="<%= base_price %>" Key="0QmzF+Y+RMmS5ZaDLsyMpA==" Taxes="<%= taxes %>" TotalPrice="<%= total_price %>">
		<air:AirSegment ArrivalTime="<%= flight_arrival_time %>" Carrier="<%= carrier %>" ChangeOfPlane="<%= change_of_plane %>" DepartureTime="<%= departure_time %>" Destination="<%= destination %>" FlightNumber="<%= flight_number %>" Group="<%= group %>" Key="<%= flight_key %>" OptionalServicesIndicator="false" Origin="<%= origin %>" ParticipantLevel="<%= participant_level %>" ProviderCode="1P" />
		<air:AirPricingInfo ApproximateBasePrice="<%= base_price %>" ApproximateTotalPrice="<%= approximate_total_price %>" BasePrice="<%= base_price %>" Key="cDxZLlPpS9i3UXEf5vfsXQ==" LatestTicketingTime="<%= latest_ticketing_time %>" PlatingCarrier="AM" PricingMethod="Auto" ProviderCode="1P" Taxes="<%= taxes %>" TotalPrice="<%= total_price %>">
		  <air:FareInfo Amount="<%= total_price %>" Destination="<%= destination %>" EffectiveDate="<%= effective_date %>" FareBasis="TSL" Key="PBbswxCHT+WZopgqLTW+NA==" Origin="<%= origin %>" PassengerTypeCode="ADT">
		    <air:FareRuleKey FareInfoRef="PBbswxCHT+WZopgqLTW+NA==" ProviderCode="1P">
	IjzK14eXiiRSBd8xfl3Qh4AhCCuiq2+HKW5ELm3fTCgQUFz1xal2RrRek//OjKKuEn8Mg+HAuzIWPEfNDkErG+RsBfJKkIog
	</air:FareRuleKey>
		  </air:FareInfo>
		  <air:BookingInfo BookingCode="T" FareInfoRef="PBbswxCHT+WZopgqLTW+NA==" SegmentRef="<%= flight_key %>" />
		  <air:TaxInfo Category="MX" Amount="MXN228" Key="MMRvyRd8Rw+iIwOw/W++iA==" />
		  <air:TaxInfo Category="XV" Amount="MXN413" Key="daFmca8aR+y7rpeJiegKpA==" />
		  <air:TaxInfo Category="YR" Amount="MXN17" Key="+afoT23tR6aN7vZRPQPQ0A==" />
		  <air:FareCalc>
	ADT DEN UA CHI115.35USD115.35END UA ZPDEN XT5.60AY4.50XF DEN4.5
	</air:FareCalc>
		  <air:PassengerType BookingTravelerRef="gr8AVWGCR064r57Jt0+8bA==" Code="ADT" />
		</air:AirPricingInfo>
	      </air:AirPricingSolution>
	      <com:ActionStatus xmlns:com="http://www.travelport.com/schema/common_v31_0" ProviderCode="1P" TicketDate="<%= ticket_date %>" Type="TAW" />
	    </univ:AirCreateReservationReq>
	  </soapenv:Body>
	</soapenv:Envelope>
    template

  end
end
