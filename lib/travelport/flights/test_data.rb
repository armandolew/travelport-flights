module Travelport
  module Flights
    #Test data
    TEST_ONE_WAY_RESPONSE_DATA = <<-template
      <SOAP:Envelope xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/">
          <SOAP:Body>
              <air:LowFareSearchRsp TraceId="trace" TransactionId="6686CC617F000001DB15C4B650B56576" ResponseTime="7315" DistanceUnits="MI" CurrencyType="MXN" xmlns:common_v25_0="http://www.travelport.com/schema/common_v25_0" xmlns:air="http://www.travelport.com/schema/air_v25_0">
                  <common_v25_0:ResponseMessage Code="701349" Type="Warning" ProviderCode="1P">PreferNonStop cannot be combined with FlightType options and FlightType options are ignored in the request.</common_v25_0:ResponseMessage>
                  <air:FlightDetailsList>
                      <air:FlightDetails Key="c17JaZ78TziEI7vIAFxtMA==" Origin="MEX" Destination="IAH" DepartureTime="2014-07-01T10:10:00.000-05:00" ArrivalTime="2014-07-01T12:26:00.000-05:00" FlightTime="136" TravelTime="136" Distance="764" Equipment="EMJ" OriginTerminal="2" DestinationTerminal="D" />
                      <air:FlightDetails Key="S0Fp+aV2S7iiSKAiJDFkhw==" Origin="IAH" Destination="CDG" DepartureTime="2014-07-01T16:00:00.000-05:00" ArrivalTime="2014-07-02T08:35:00.000+02:00" FlightTime="575" TravelTime="789" Distance="5028" Equipment="77W" OriginTerminal="D" DestinationTerminal="2E" />
                      <air:FlightDetails Key="69qKJ4TPSo+RDJttUafGSg==" Origin="MEX" Destination="DTW" DepartureTime="2014-07-01T14:39:00.000-05:00" ArrivalTime="2014-07-01T20:04:00.000-04:00" FlightTime="265" TravelTime="265" Distance="1844" Equipment="319" OriginTerminal="2" DestinationTerminal="EM" />
                      <air:FlightDetails Key="TMlfzT3WR4uKKNLCleOctQ==" Origin="DTW" Destination="CDG" DepartureTime="2014-07-01T21:35:00.000-04:00" ArrivalTime="2014-07-02T11:30:00.000+02:00" FlightTime="475" TravelTime="566" Distance="3946" Equipment="343" OriginTerminal="EM" DestinationTerminal="2E" />
                      <air:FlightDetails Key="ZJw6MU9BSBmQyiqLxrt9+Q==" Origin="MEX" Destination="ATL" DepartureTime="2014-07-01T09:46:00.000-05:00" ArrivalTime="2014-07-01T14:14:00.000-04:00" FlightTime="208" TravelTime="208" Distance="1345" Equipment="738" OriginTerminal="2" DestinationTerminal="I" />
                      <air:FlightDetails Key="aE8lZSCBQp6rjqPqLifoyQ==" Origin="ATL" Destination="CDG" DepartureTime="2014-07-01T17:40:00.000-04:00" ArrivalTime="2014-07-02T08:10:00.000+02:00" FlightTime="510" TravelTime="716" Distance="4390" Equipment="77W" OriginTerminal="I" DestinationTerminal="2E" />
                      <air:FlightDetails Key="eQXW2cb+SJWC4glg8++WJw==" Origin="MEX" Destination="JFK" DepartureTime="2014-07-01T10:19:00.000-05:00" ArrivalTime="2014-07-01T16:15:00.000-04:00" FlightTime="296" TravelTime="296" Distance="2100" Equipment="738" OriginTerminal="2" DestinationTerminal="1" />
                      <air:FlightDetails Key="7yNlIqWWTsuKBAiwenrK5Q==" Origin="JFK" Destination="CDG" DepartureTime="2014-07-01T19:05:00.000-04:00" ArrivalTime="2014-07-02T08:30:00.000+02:00" FlightTime="445" TravelTime="615" Distance="3635" Equipment="388" OriginTerminal="1" DestinationTerminal="2E" />
                      <air:FlightDetails Key="ZUd+JUpqRl+D3giYmS3FOA==" Origin="MEX" Destination="JFK" DepartureTime="2014-07-01T07:10:00.000-05:00" ArrivalTime="2014-07-01T13:00:00.000-04:00" FlightTime="290" TravelTime="290" Distance="2100" Equipment="787" OriginTerminal="2" DestinationTerminal="1" />
                      <air:FlightDetails Key="zK7umeWjTN2FQUFozc3oag==" Origin="JFK" Destination="CDG" DepartureTime="2014-07-01T16:25:00.000-04:00" ArrivalTime="2014-07-02T05:50:00.000+02:00" FlightTime="445" TravelTime="650" Distance="3635" Equipment="332" OriginTerminal="1" DestinationTerminal="2E" />
                      <air:FlightDetails Key="GA8SfpTYTjK1NHBgMHPVHw==" Origin="MEX" Destination="DFW" DepartureTime="2014-07-01T13:10:00.000-05:00" ArrivalTime="2014-07-01T15:50:00.000-05:00" FlightTime="160" TravelTime="160" Distance="944" Equipment="M80" OriginTerminal="1" DestinationTerminal="D" />
                      <air:FlightDetails Key="OMI4YP0nT0WEqesJUO5qWA==" Origin="DFW" Destination="LHR" DepartureTime="2014-07-01T18:35:00.000-05:00" ArrivalTime="2014-07-02T09:35:00.000+01:00" FlightTime="540" TravelTime="705" Distance="4752" Equipment="744" OriginTerminal="D" DestinationTerminal="5" />
                      <air:FlightDetails Key="Z74sN4srRpeD4sXbVJ/Z6w==" Origin="LHR" Destination="CDG" DepartureTime="2014-07-02T10:45:00.000+01:00" ArrivalTime="2014-07-02T13:00:00.000+02:00" FlightTime="75" TravelTime="145" Distance="214" Equipment="321" OriginTerminal="5" DestinationTerminal="2A" />
                      <air:FlightDetails Key="ZXJagCLUQe+yqzgYFBFaxg==" Origin="MEX" Destination="ORD" DepartureTime="2014-07-01T13:55:00.000-05:00" ArrivalTime="2014-07-01T18:00:00.000-05:00" FlightTime="245" TravelTime="245" Distance="1695" Equipment="738" OriginTerminal="1" DestinationTerminal="5" />
                      <air:FlightDetails Key="hHSy0XhOQ+CeguiPIrPx7A==" Origin="ORD" Destination="LHR" DepartureTime="2014-07-01T20:20:00.000-05:00" ArrivalTime="2014-07-02T10:00:00.000+01:00" FlightTime="460" TravelTime="600" Distance="3958" Equipment="777" OriginTerminal="5" DestinationTerminal="5" />
                      <air:FlightDetails Key="o0dCmZlhRz61xuZRl8ElBA==" Origin="LHR" Destination="CDG" DepartureTime="2014-07-02T13:45:00.000+01:00" ArrivalTime="2014-07-02T16:00:00.000+02:00" FlightTime="75" TravelTime="300" Distance="214" Equipment="319" OriginTerminal="5" DestinationTerminal="2A" />
                      <air:FlightDetails Key="tmzo7b4hSCSsgAnwTYTlDQ==" Origin="MEX" Destination="CLT" DepartureTime="2014-07-01T13:35:00.000-05:00" ArrivalTime="2014-07-01T18:31:00.000-04:00" FlightTime="236" TravelTime="236" Distance="1567" Equipment="319" OriginTerminal="1" />
                      <air:FlightDetails Key="4RMLCVAJQ9SObMCVpg9g+g==" Origin="CLT" Destination="CDG" DepartureTime="2014-07-02T16:45:00.000-04:00" ArrivalTime="2014-07-03T06:55:00.000+02:00" FlightTime="490" TravelTime="1824" Distance="4169" Equipment="333" DestinationTerminal="1" />
                      <air:FlightDetails Key="N3Go/O3IQtWQWCuWqYg3JA==" Origin="MEX" Destination="DTW" DepartureTime="2014-07-01T14:39:00.000-05:00" ArrivalTime="2014-07-01T20:04:00.000-04:00" FlightTime="265" TravelTime="265" Distance="1844" Equipment="319" OriginTerminal="2" DestinationTerminal="EM" />
                      <air:FlightDetails Key="Rxmg26NsT+aWSBlhHxD0UQ==" Origin="DTW" Destination="CDG" DepartureTime="2014-07-01T21:35:00.000-04:00" ArrivalTime="2014-07-02T11:30:00.000+02:00" FlightTime="475" TravelTime="566" Distance="3946" Equipment="343" OriginTerminal="EM" DestinationTerminal="2E" />
                      <air:FlightDetails Key="nuFTqPncTKqn3IZLP6jJTA==" Origin="MEX" Destination="CDG" DepartureTime="2014-07-01T20:35:00.000-05:00" ArrivalTime="2014-07-02T14:10:00.000+02:00" FlightTime="635" TravelTime="635" Distance="5735" Equipment="744" OriginTerminal="1" DestinationTerminal="2E" />
                      <air:FlightDetails Key="6dCnwFNjSfS8he/o7IhGaQ==" Origin="MEX" Destination="CDG" DepartureTime="2014-07-01T23:45:00.000-05:00" ArrivalTime="2014-07-02T17:35:00.000+02:00" FlightTime="650" TravelTime="650" Distance="5735" Equipment="788" OriginTerminal="2" DestinationTerminal="2E" />
                      <air:FlightDetails Key="cMAnIfJBSl+qlh0czdPkgw==" Origin="MEX" Destination="AMS" DepartureTime="2014-07-01T21:00:00.000-05:00" ArrivalTime="2014-07-02T14:35:00.000+02:00" FlightTime="635" TravelTime="635" Distance="5735" Equipment="74E" OriginTerminal="1" />
                      <air:FlightDetails Key="0J0IX1d8REeLsnuOMXH+9w==" Origin="AMS" Destination="CDG" DepartureTime="2014-07-02T16:25:00.000+02:00" ArrivalTime="2014-07-02T17:40:00.000+02:00" FlightTime="75" TravelTime="185" Distance="247" Equipment="737" DestinationTerminal="2F" />
                      <air:FlightDetails Key="+QtwxkI8SDadYD2nSCgzKA==" Origin="MEX" Destination="CDG" DepartureTime="2014-07-01T20:35:00.000-05:00" ArrivalTime="2014-07-02T14:10:00.000+02:00" FlightTime="635" TravelTime="635" Distance="5735" Equipment="744" OriginTerminal="1" DestinationTerminal="2E" />
                      <air:FlightDetails Key="0kLrDQ/NQMyBHI+Mn3H+jQ==" Origin="MEX" Destination="CDG" DepartureTime="2014-07-01T23:45:00.000-05:00" ArrivalTime="2014-07-02T17:35:00.000+02:00" FlightTime="650" TravelTime="650" Distance="5735" Equipment="787" OriginTerminal="2" DestinationTerminal="2E" />
                  </air:FlightDetailsList>
                  <air:AirSegmentList>
                      <air:AirSegment Key="AUFkPaCvRFOnsTFEYlKa3A==" Group="0" Carrier="DL" FlightNumber="8025" Origin="MEX" Destination="IAH" DepartureTime="2014-07-01T10:10:00.000-05:00" ArrivalTime="2014-07-01T12:26:00.000-05:00" FlightTime="136" Distance="764" ETicketability="Yes" Equipment="EMJ" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <common_v25_0:SegmentRemark Key="YBwOuLCySyCItwwO/99ScA==">   DL  8025 AEROLITORAL DBA AEROMEXICO CONNECT</common_v25_0:SegmentRemark>
                          <air:CodeshareInfo OperatingCarrier="AM" OperatingFlightNumber="472">AM472</air:CodeshareInfo>
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="Y6" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="c17JaZ78TziEI7vIAFxtMA==" />
                      </air:AirSegment>
                      <air:AirSegment Key="rlGf/ziIQjGQokGtJWc18Q==" Group="0" Carrier="DL" FlightNumber="8667" Origin="IAH" Destination="CDG" DepartureTime="2014-07-01T16:00:00.000-05:00" ArrivalTime="2014-07-02T08:35:00.000+02:00" FlightTime="575" Distance="5028" ETicketability="Yes" Equipment="77W" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <common_v25_0:SegmentRemark Key="1GCtO1kVSPOVeamXigeheA==">   DL  8667 AIR FRANCE</common_v25_0:SegmentRemark>
                          <air:CodeshareInfo OperatingCarrier="AF" OperatingFlightNumber="639">AF639</air:CodeshareInfo>
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="W9" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="S0Fp+aV2S7iiSKAiJDFkhw==" />
                      </air:AirSegment>
                      <air:AirSegment Key="YiCzQ5ZkTVe+Zn4B2RWINA==" Group="0" Carrier="DL" FlightNumber="512" Origin="MEX" Destination="DTW" DepartureTime="2014-07-01T14:39:00.000-05:00" ArrivalTime="2014-07-01T20:04:00.000-04:00" FlightTime="265" Distance="1844" ETicketability="Yes" Equipment="319" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="Y9" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="69qKJ4TPSo+RDJttUafGSg==" />
                      </air:AirSegment>
                      <air:AirSegment Key="VjHDFfxSRVSP5p/lZs1nBw==" Group="0" Carrier="DL" FlightNumber="8573" Origin="DTW" Destination="CDG" DepartureTime="2014-07-01T21:35:00.000-04:00" ArrivalTime="2014-07-02T11:30:00.000+02:00" FlightTime="475" Distance="3946" ETicketability="Yes" Equipment="343" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <common_v25_0:SegmentRemark Key="/rPHWKt6Qo2Y6vN+eknjTQ==">   DL  8573 AIR FRANCE</common_v25_0:SegmentRemark>
                          <air:CodeshareInfo OperatingCarrier="AF" OperatingFlightNumber="377">AF377</air:CodeshareInfo>
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="W9" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="TMlfzT3WR4uKKNLCleOctQ==" />
                      </air:AirSegment>
                      <air:AirSegment Key="ED9HmzRJQb6ci1sjmqaRGg==" Group="0" Carrier="DL" FlightNumber="130" Origin="MEX" Destination="ATL" DepartureTime="2014-07-01T09:46:00.000-05:00" ArrivalTime="2014-07-01T14:14:00.000-04:00" FlightTime="208" Distance="1345" ETicketability="Yes" Equipment="738" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="Y9" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="ZJw6MU9BSBmQyiqLxrt9+Q==" />
                      </air:AirSegment>
                      <air:AirSegment Key="S3o715yxSdOa4PzJZ7BjKw==" Group="0" Carrier="DL" FlightNumber="8517" Origin="ATL" Destination="CDG" DepartureTime="2014-07-01T17:40:00.000-04:00" ArrivalTime="2014-07-02T08:10:00.000+02:00" FlightTime="510" Distance="4390" ETicketability="Yes" Equipment="77W" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <common_v25_0:SegmentRemark Key="SFZ57PujSDyuwyc1XGon5g==">   DL  8517 AIR FRANCE</common_v25_0:SegmentRemark>
                          <air:CodeshareInfo OperatingCarrier="AF" OperatingFlightNumber="681">AF681</air:CodeshareInfo>
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="W8" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="aE8lZSCBQp6rjqPqLifoyQ==" />
                      </air:AirSegment>
                      <air:AirSegment Key="E3fAoutiTVq0N3Fgf03R9w==" Group="0" Carrier="DL" FlightNumber="1029" Origin="MEX" Destination="JFK" DepartureTime="2014-07-01T10:19:00.000-05:00" ArrivalTime="2014-07-01T16:15:00.000-04:00" FlightTime="296" Distance="2100" ETicketability="Yes" Equipment="738" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <common_v25_0:SegmentRemark Key="Px6CrR+5Q+WbI9sybeXp9Q==">   DL  1029 AEROMEXICO</common_v25_0:SegmentRemark>
                          <air:CodeshareInfo OperatingCarrier="AM" OperatingFlightNumber="402">AM402</air:CodeshareInfo>
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="Y9" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="eQXW2cb+SJWC4glg8++WJw==" />
                      </air:AirSegment>
                      <air:AirSegment Key="W/lAUE92Qe6LWVoUdXLQGQ==" Group="0" Carrier="DL" FlightNumber="1015" Origin="JFK" Destination="CDG" DepartureTime="2014-07-01T19:05:00.000-04:00" ArrivalTime="2014-07-02T08:30:00.000+02:00" FlightTime="445" Distance="3635" ETicketability="Yes" Equipment="388" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <common_v25_0:SegmentRemark Key="WPeLX/DmSuyLNCTyrlz7Ew==">   DL  1015 AIR FRANCE</common_v25_0:SegmentRemark>
                          <air:CodeshareInfo OperatingCarrier="AF" OperatingFlightNumber="7">AF7</air:CodeshareInfo>
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="W9" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="7yNlIqWWTsuKBAiwenrK5Q==" />
                      </air:AirSegment>
                      <air:AirSegment Key="bkA7LmDHRDGEqRc0NV4zXQ==" Group="0" Carrier="DL" FlightNumber="1030" Origin="MEX" Destination="JFK" DepartureTime="2014-07-01T07:10:00.000-05:00" ArrivalTime="2014-07-01T13:00:00.000-04:00" FlightTime="290" Distance="2100" ETicketability="Yes" Equipment="787" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <common_v25_0:SegmentRemark Key="rXTHzvnhT0OWbSJiuYaLkQ==">   DL  1030 AEROMEXICO</common_v25_0:SegmentRemark>
                          <air:CodeshareInfo OperatingCarrier="AM" OperatingFlightNumber="408">AM408</air:CodeshareInfo>
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="Y9" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="ZUd+JUpqRl+D3giYmS3FOA==" />
                      </air:AirSegment>
                      <air:AirSegment Key="8oNtgdN8QMWR9YfPh2LWxw==" Group="0" Carrier="DL" FlightNumber="1016" Origin="JFK" Destination="CDG" DepartureTime="2014-07-01T16:25:00.000-04:00" ArrivalTime="2014-07-02T05:50:00.000+02:00" FlightTime="445" Distance="3635" ETicketability="Yes" Equipment="332" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <common_v25_0:SegmentRemark Key="c76K5CJ0T4KvsvyPlTUtuA==">   DL  1016 AIR FRANCE</common_v25_0:SegmentRemark>
                          <air:CodeshareInfo OperatingCarrier="AF" OperatingFlightNumber="23">AF23</air:CodeshareInfo>
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="W9" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="zK7umeWjTN2FQUFozc3oag==" />
                      </air:AirSegment>
                      <air:AirSegment Key="s3Z5h7S7RzyyWoIk7c9H4A==" Group="0" Carrier="AA" FlightNumber="389" Origin="MEX" Destination="DFW" DepartureTime="2014-07-01T13:10:00.000-05:00" ArrivalTime="2014-07-01T15:50:00.000-05:00" FlightTime="160" Distance="944" ETicketability="Yes" Equipment="M80" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="D7" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="GA8SfpTYTjK1NHBgMHPVHw==" />
                      </air:AirSegment>
                      <air:AirSegment Key="fkgTljM1Tu663iEQuZ6b+A==" Group="0" Carrier="AA" FlightNumber="6153" Origin="DFW" Destination="LHR" DepartureTime="2014-07-01T18:35:00.000-05:00" ArrivalTime="2014-07-02T09:35:00.000+01:00" FlightTime="540" Distance="4752" ETicketability="Yes" Equipment="744" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <common_v25_0:SegmentRemark Key="HJiJImGWQqmF2GpXrIVByw==">   AA  6153 BRITISH AIRWAYS</common_v25_0:SegmentRemark>
                          <air:CodeshareInfo OperatingCarrier="BA" OperatingFlightNumber="192">BA192</air:CodeshareInfo>
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="W7" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="OMI4YP0nT0WEqesJUO5qWA==" />
                      </air:AirSegment>
                      <air:AirSegment Key="GhHFq5ZxSf2dLzxgfp/VQA==" Group="0" Carrier="AA" FlightNumber="6552" Origin="LHR" Destination="CDG" DepartureTime="2014-07-02T10:45:00.000+01:00" ArrivalTime="2014-07-02T13:00:00.000+02:00" FlightTime="75" Distance="214" ETicketability="Yes" Equipment="321" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <common_v25_0:SegmentRemark Key="udGJKR5cQjGtKGMc6vS0EA==">   AA  6552 BRITISH AIRWAYS</common_v25_0:SegmentRemark>
                          <air:CodeshareInfo OperatingCarrier="BA" OperatingFlightNumber="308">BA308</air:CodeshareInfo>
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="Y7" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="Z74sN4srRpeD4sXbVJ/Z6w==" />
                      </air:AirSegment>
                      <air:AirSegment Key="pbjpR/0jQ0SIygoymMQmVQ==" Group="0" Carrier="AA" FlightNumber="1597" Origin="MEX" Destination="ORD" DepartureTime="2014-07-01T13:55:00.000-05:00" ArrivalTime="2014-07-01T18:00:00.000-05:00" FlightTime="245" Distance="1695" ETicketability="Yes" Equipment="738" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="D7" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="ZXJagCLUQe+yqzgYFBFaxg==" />
                      </air:AirSegment>
                      <air:AirSegment Key="4nU9XVZsRy2vdpecu9w7dw==" Group="0" Carrier="AA" FlightNumber="6196" Origin="ORD" Destination="LHR" DepartureTime="2014-07-01T20:20:00.000-05:00" ArrivalTime="2014-07-02T10:00:00.000+01:00" FlightTime="460" Distance="3958" ETicketability="Yes" Equipment="777" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <common_v25_0:SegmentRemark Key="HfscJXNATMGLr1lQFW7lxA==">   AA  6196 BRITISH AIRWAYS</common_v25_0:SegmentRemark>
                          <air:CodeshareInfo OperatingCarrier="BA" OperatingFlightNumber="296">BA296</air:CodeshareInfo>
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="W7" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="hHSy0XhOQ+CeguiPIrPx7A==" />
                      </air:AirSegment>
                      <air:AirSegment Key="IaT0OhHrS4Gaj7JoLu/JEw==" Group="0" Carrier="AA" FlightNumber="6556" Origin="LHR" Destination="CDG" DepartureTime="2014-07-02T13:45:00.000+01:00" ArrivalTime="2014-07-02T16:00:00.000+02:00" FlightTime="75" Distance="214" ETicketability="Yes" Equipment="319" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <common_v25_0:SegmentRemark Key="bqDGmAyoT3e7C0dm0PNvyQ==">   AA  6556 BRITISH AIRWAYS</common_v25_0:SegmentRemark>
                          <air:CodeshareInfo OperatingCarrier="BA" OperatingFlightNumber="314">BA314</air:CodeshareInfo>
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="Y7" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="o0dCmZlhRz61xuZRl8ElBA==" />
                      </air:AirSegment>
                      <air:AirSegment Key="e3+1fKBXSsCY7oHc3fk7Wg==" Group="0" Carrier="US" FlightNumber="828" Origin="MEX" Destination="CLT" DepartureTime="2014-07-01T13:35:00.000-05:00" ArrivalTime="2014-07-01T18:31:00.000-04:00" FlightTime="236" Distance="1567" ETicketability="Yes" Equipment="319" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="B9" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="tmzo7b4hSCSsgAnwTYTlDQ==" />
                      </air:AirSegment>
                      <air:AirSegment Key="WHaBZpv+RzmDHUXWBQPsPQ==" Group="0" Carrier="US" FlightNumber="786" Origin="CLT" Destination="CDG" DepartureTime="2014-07-02T16:45:00.000-04:00" ArrivalTime="2014-07-03T06:55:00.000+02:00" FlightTime="490" Distance="4169" ETicketability="Yes" Equipment="333" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="B9" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="4RMLCVAJQ9SObMCVpg9g+g==" />
                      </air:AirSegment>
                      <air:AirSegment Key="1XWwP/UZSq65e+jbEnXTaA==" Group="0" Carrier="AF" FlightNumber="2571" Origin="MEX" Destination="DTW" DepartureTime="2014-07-01T14:39:00.000-05:00" ArrivalTime="2014-07-01T20:04:00.000-04:00" FlightTime="265" Distance="1844" ETicketability="Yes" Equipment="319" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <common_v25_0:SegmentRemark Key="8E1Rx359T+2LGLAZoqwHLg==">   AF  2571 DELTA AIR LINES</common_v25_0:SegmentRemark>
                          <air:CodeshareInfo OperatingCarrier="DL" OperatingFlightNumber="512">DL512</air:CodeshareInfo>
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="S9" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="N3Go/O3IQtWQWCuWqYg3JA==" />
                      </air:AirSegment>
                      <air:AirSegment Key="FDjs+GJYRfuvT0SXzJG4OQ==" Group="0" Carrier="AF" FlightNumber="377" Origin="DTW" Destination="CDG" DepartureTime="2014-07-01T21:35:00.000-04:00" ArrivalTime="2014-07-02T11:30:00.000+02:00" FlightTime="475" Distance="3946" ETicketability="Yes" Equipment="343" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="S9" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="Rxmg26NsT+aWSBlhHxD0UQ==" />
                      </air:AirSegment>
                      <air:AirSegment Key="q+kGgxxbT16Qn/3IY4g/Ww==" Group="0" Carrier="AF" FlightNumber="439" Origin="MEX" Destination="CDG" DepartureTime="2014-07-01T20:35:00.000-05:00" ArrivalTime="2014-07-02T14:10:00.000+02:00" FlightTime="635" Distance="5735" ETicketability="Yes" Equipment="744" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="B9" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="nuFTqPncTKqn3IZLP6jJTA==" />
                      </air:AirSegment>
                      <air:AirSegment Key="8l7vQBoCQRKqENZhoHJt1Q==" Group="0" Carrier="AF" FlightNumber="8099" Origin="MEX" Destination="CDG" DepartureTime="2014-07-01T23:45:00.000-05:00" ArrivalTime="2014-07-02T17:35:00.000+02:00" FlightTime="650" Distance="5735" ETicketability="Yes" Equipment="788" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <common_v25_0:SegmentRemark Key="VN8AoGO8QXupbhoW2z9BgA==">   AF  8099 AEROMEXICO</common_v25_0:SegmentRemark>
                          <air:CodeshareInfo OperatingCarrier="AM" OperatingFlightNumber="3">AM3</air:CodeshareInfo>
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="B7" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="6dCnwFNjSfS8he/o7IhGaQ==" />
                      </air:AirSegment>
                      <air:AirSegment Key="U0A/JC4UT3qRPlmmMjryaA==" Group="0" Carrier="KL" FlightNumber="686" Origin="MEX" Destination="AMS" DepartureTime="2014-07-01T21:00:00.000-05:00" ArrivalTime="2014-07-02T14:35:00.000+02:00" FlightTime="635" Distance="5735" ETicketability="Yes" Equipment="74E" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="B9" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="cMAnIfJBSl+qlh0czdPkgw==" />
                      </air:AirSegment>
                      <air:AirSegment Key="ginq6F6+RRG/cdwrkdAAbA==" Group="0" Carrier="KL" FlightNumber="1243" Origin="AMS" Destination="CDG" DepartureTime="2014-07-02T16:25:00.000+02:00" ArrivalTime="2014-07-02T17:40:00.000+02:00" FlightTime="75" Distance="247" ETicketability="Yes" Equipment="737" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="Y9" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="0J0IX1d8REeLsnuOMXH+9w==" />
                      </air:AirSegment>
                      <air:AirSegment Key="jfUf6kVqTVCUcxYVs7wCrQ==" Group="0" Carrier="AM" FlightNumber="6103" Origin="MEX" Destination="CDG" DepartureTime="2014-07-01T20:35:00.000-05:00" ArrivalTime="2014-07-02T14:10:00.000+02:00" FlightTime="635" Distance="5735" ETicketability="Yes" Equipment="744" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <common_v25_0:SegmentRemark Key="nmnvdFvVTwqU3TM+i+IhwQ==">   AM  6103 AIR FRANCE</common_v25_0:SegmentRemark>
                          <air:CodeshareInfo OperatingCarrier="AF" OperatingFlightNumber="439">AF439</air:CodeshareInfo>
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="B7" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="+QtwxkI8SDadYD2nSCgzKA==" />
                      </air:AirSegment>
                      <air:AirSegment Key="BwhOKJ5QTHKZRgDOZAg7VA==" Group="0" Carrier="AM" FlightNumber="3" Origin="MEX" Destination="CDG" DepartureTime="2014-07-01T23:45:00.000-05:00" ArrivalTime="2014-07-02T17:35:00.000+02:00" FlightTime="650" Distance="5735" ETicketability="Yes" Equipment="787" ChangeOfPlane="false" ParticipantLevel="Airline Source" OptionalServicesIndicator="false" AvailabilitySource="Seamless">
                          <air:AirAvailInfo ProviderCode="1P">
                              <air:BookingCodeInfo BookingCounts="B7" />
                          </air:AirAvailInfo>
                          <air:FlightDetailsRef Key="0kLrDQ/NQMyBHI+Mn3H+jQ==" />
                      </air:AirSegment>
                  </air:AirSegmentList>
                  <air:FareInfoList>
                      <air:FareInfo Key="RTfQRB0rRgiVM7cBpZLswg==" FareBasis="WOWMX" PassengerTypeCode="ADT" Origin="MEX" Destination="CDG" EffectiveDate="2014-04-15T17:54:48.000+00:00" DepartureDate="2014-07-01" Amount="MXN22413">
                          <air:FareRuleKey FareInfoRef="RTfQRB0rRgiVM7cBpZLswg==" ProviderCode="1P">MnU1UUMe6XCfpQpgDTuxEpqOsPoEckMkRMRSBNshX+Y4hUkJikXsgTbotsRNmzgm/Vwy8K+tJqZmyK4jZ+OGqSgMXr7PMH/A</air:FareRuleKey>
                          <air:Brand Key="Kzpf6/idTQiawWwZ6R0Bsg==" BrandID="3917" UpSellBrandID="3918">
                              <air:UpsellBrand FareBasis="CFFWMX" FareInfoRef="/LVCMoxQR/KOmOBfJl1A3Q==" />
                          </air:Brand>
                      </air:FareInfo>
                      <air:FareInfo Key="/LVCMoxQR/KOmOBfJl1A3Q==" FareBasis="CFFWMX" PassengerTypeCode="ADT" Origin="MEX" Destination="CDG" EffectiveDate="2014-04-15T17:54:48.000+00:00" DepartureDate="2014-07-01" Amount="MXN63404">
                          <air:FareRuleKey FareInfoRef="/LVCMoxQR/KOmOBfJl1A3Q==" ProviderCode="1P">JqkSUZXbn/TdvOasOfs7dbgSJSE0Ux7GqcL83be1ga4uofgWpODE0mZ4GxBSq1js8BYifgjckCuboI+cmLf+YWZhag+VuWAQ</air:FareRuleKey>
                          <air:Brand Key="zLMwI6mMRUaCkEc0Fmamqg==" BrandID="3918" UpSellBrandFound="false" />
                      </air:FareInfo>
                      <air:FareInfo Key="Bjh86MuoQUO0tsTf4juBkw==" FareBasis="W2MO" PassengerTypeCode="ADT" Origin="MEX" Destination="CDG" EffectiveDate="2014-04-15T17:54:48.000+00:00" DepartureDate="2014-07-01" Amount="MXN24532">
                          <air:FareRuleKey FareInfoRef="Bjh86MuoQUO0tsTf4juBkw==" ProviderCode="1P">7aA2dVHfG3g8/9TM5YBn9gckPAJurugNtf2S0bwEtNPGyo9xfE/RMiS2ZDEdSgVXSrWqYI/XFX7BbNL1JufKSORsBfJKkIog</air:FareRuleKey>
                          <air:Brand Key="Vls4vdbkR7eIt8x8zrpOGg==" BrandFound="false" UpSellBrandFound="false" />
                      </air:FareInfo>
                      <air:FareInfo Key="dBtzNuKWTNaARh6/xvT/nA==" FareBasis="BHWAQNE0" PassengerTypeCode="ADT" Origin="MEX" Destination="CDG" EffectiveDate="2014-04-15T17:54:48.000+00:00" DepartureDate="2014-07-01" Amount="MXN25448">
                          <air:FareRuleKey FareInfoRef="dBtzNuKWTNaARh6/xvT/nA==" ProviderCode="1P">U7NdRtfN01//iEpXYUVMf0URp3fCx5s8jkMWN2G+PF2CE9bJLfZw7x03kMJ5I8IGn5MZKOkYLia7JhhsKZwR3XONlwhm2GSK</air:FareRuleKey>
                      </air:FareInfo>
                      <air:FareInfo Key="L7M/IbGbQReuzvrz01657Q==" FareBasis="SFFWMX" PassengerTypeCode="ADT" Origin="MEX" Destination="CDG" EffectiveDate="2014-04-15T17:54:48.000+00:00" DepartureDate="2014-07-01" Amount="MXN30616">
                          <air:FareRuleKey FareInfoRef="L7M/IbGbQReuzvrz01657Q==" ProviderCode="1P">RzqjiFt8wPrdvOasOfs7dbgSJSE0Ux7GqcL83be1ga4uofgWpODE0mZ4GxBSq1js8BYifgjckCuUVzkAGTX27GZhag+VuWAQ</air:FareRuleKey>
                      </air:FareInfo>
                      <air:FareInfo Key="LwqvL+QMQzaS7c/Dv2M6Ow==" FareBasis="BHFFWMX" PassengerTypeCode="ADT" Origin="MEX" Destination="CDG" EffectiveDate="2014-04-15T17:54:48.000+00:00" DepartureDate="2014-07-01" Amount="MXN31218">
                          <air:FareRuleKey FareInfoRef="LwqvL+QMQzaS7c/Dv2M6Ow==" ProviderCode="1P">q1pfVn2lB3CfU1dZ9s0yEPkRx7DjxEiMRhJYkr53I0ajprjs/++QXlumrR85gbDZA7b4abjsgR8tidXdVk9GtzVIB/4lCKP7</air:FareRuleKey>
                      </air:FareInfo>
                      <air:FareInfo Key="JifHcTMwTzmwJe8Sqd86Pw==" FareBasis="BOHAP" PassengerTypeCode="ADT" Origin="MEX" Destination="CDG" EffectiveDate="2014-04-15T17:54:48.000+00:00" DepartureDate="2014-07-01" Amount="MXN31872">
                          <air:FareRuleKey FareInfoRef="JifHcTMwTzmwJe8Sqd86Pw==" ProviderCode="1P">qUShVYsrCpyfpQpgDTuxEpqOsPoEckMkRMRSBNshX+Y4hUkJikXsgTbotsRNmzgm/Vwy8K+tJqbqbTrrCCQ+wigMXr7PMH/A</air:FareRuleKey>
                      </air:FareInfo>
                  </air:FareInfoList>
                  <air:RouteList>
                      <air:Route Key="UJTywRt1QeG9LC4W66rY+w==">
                          <air:Leg Key="PY3n8SmsQi+LfUtVe571VQ==" Group="0" Origin="MEX" Destination="PAR" />
                      </air:Route>
                  </air:RouteList>
                  <air:AirPricingSolution Key="6i1i9765RLuicxEX7xu3/w==" TotalPrice="MXN27023" BasePrice="MXN22413" ApproximateTotalPrice="MXN27023" ApproximateBasePrice="MXN22413" Taxes="MXN4610">
                      <air:Journey TravelTime="P0DT15H25M0S">
                          <air:AirSegmentRef Key="AUFkPaCvRFOnsTFEYlKa3A==" />
                          <air:AirSegmentRef Key="rlGf/ziIQjGQokGtJWc18Q==" />
                      </air:Journey>
                      <air:LegRef Key="PY3n8SmsQi+LfUtVe571VQ==" />
                      <air:AirPricingInfo Key="TyftwBxtSpySIJVY80AzZA==" TotalPrice="MXN27023" BasePrice="MXN22413" ApproximateTotalPrice="MXN27023" ApproximateBasePrice="MXN22413" Taxes="MXN4610" LatestTicketingTime="2014-04-18T23:59:00.000+00:00" PricingMethod="Auto" Refundable="true" ETicketability="Yes" PlatingCarrier="DL" ProviderCode="1P">
                          <air:FareInfoRef Key="RTfQRB0rRgiVM7cBpZLswg==" />
                          <air:BookingInfo BookingCode="Y" CabinClass="Economy" FareInfoRef="RTfQRB0rRgiVM7cBpZLswg==" SegmentRef="AUFkPaCvRFOnsTFEYlKa3A==" />
                          <air:BookingInfo BookingCode="W" CabinClass="PremiumEconomy" FareInfoRef="RTfQRB0rRgiVM7cBpZLswg==" SegmentRef="rlGf/ziIQjGQokGtJWc18Q==" />
                          <air:TaxInfo Category="AY" Amount="MXN33" />
                          <air:TaxInfo Category="XA" Amount="MXN66" />
                          <air:TaxInfo Category="XF" Amount="MXN40" />
                          <air:TaxInfo Category="XY" Amount="MXN92" />
                          <air:TaxInfo Category="YC" Amount="MXN72" />
                          <air:TaxInfo Category="XD" Amount="MXN579" />
                          <air:TaxInfo Category="XO" Amount="MXN1006" />
                          <air:TaxInfo Category="YR" Amount="MXN2722" />
                          <air:TaxInfo Category="XF" Amount="USD3.00">
                              <air:TaxDetail Amount="USD3.00" OriginAirport="IAH" />
                          </air:TaxInfo>
                          <air:PassengerType Code="ADT" />
                      </air:AirPricingInfo>
                      <air:Connection SegmentIndex="0" />
                  </air:AirPricingSolution>
                  <air:AirPricingSolution Key="1fv54R/MSfOVgtbe5t+sgA==" TotalPrice="MXN71218" BasePrice="MXN63404" ApproximateTotalPrice="MXN71218" ApproximateBasePrice="MXN63404" Taxes="MXN7814">
                      <air:Journey TravelTime="P0DT15H25M0S">
                          <air:AirSegmentRef Key="AUFkPaCvRFOnsTFEYlKa3A==" />
                          <air:AirSegmentRef Key="rlGf/ziIQjGQokGtJWc18Q==" />
                      </air:Journey>
                      <air:LegRef Key="PY3n8SmsQi+LfUtVe571VQ==" />
                      <air:AirPricingInfo Key="M5B3p9zNSYmPAHdgxIAXtw==" TotalPrice="MXN71218" BasePrice="MXN63404" ApproximateTotalPrice="MXN71218" ApproximateBasePrice="MXN63404" Taxes="MXN7814" PricingMethod="Auto" ProviderCode="1P">
                          <air:FareInfoRef Key="/LVCMoxQR/KOmOBfJl1A3Q==" />
                          <air:BookingInfo BookingCode="C" CabinClass="Business" FareInfoRef="/LVCMoxQR/KOmOBfJl1A3Q==" SegmentRef="AUFkPaCvRFOnsTFEYlKa3A==" />
                          <air:BookingInfo BookingCode="C" CabinClass="Business" FareInfoRef="/LVCMoxQR/KOmOBfJl1A3Q==" SegmentRef="rlGf/ziIQjGQokGtJWc18Q==" />
                          <air:PassengerType Code="ADT" />
                      </air:AirPricingInfo>
                      <air:Connection SegmentIndex="0" />
                  </air:AirPricingSolution>
                  <air:AirPricingSolution Key="tIHC14ttRNqbS9rNoTFWTg==" TotalPrice="MXN27042" BasePrice="MXN22413" ApproximateTotalPrice="MXN27042" ApproximateBasePrice="MXN22413" Taxes="MXN4629">
                      <air:Journey TravelTime="P0DT13H51M0S">
                          <air:AirSegmentRef Key="YiCzQ5ZkTVe+Zn4B2RWINA==" />
                          <air:AirSegmentRef Key="VjHDFfxSRVSP5p/lZs1nBw==" />
                      </air:Journey>
                      <air:LegRef Key="PY3n8SmsQi+LfUtVe571VQ==" />
                      <air:AirPricingInfo Key="UbVWEoMLSa2oSxueD2ClhQ==" TotalPrice="MXN27042" BasePrice="MXN22413" ApproximateTotalPrice="MXN27042" ApproximateBasePrice="MXN22413" Taxes="MXN4629" LatestTicketingTime="2014-04-18T23:59:00.000+00:00" PricingMethod="Auto" Refundable="true" ETicketability="Yes" PlatingCarrier="DL" ProviderCode="1P">
                          <air:FareInfoRef Key="RTfQRB0rRgiVM7cBpZLswg==" />
                          <air:BookingInfo BookingCode="Y" CabinClass="Economy" FareInfoRef="RTfQRB0rRgiVM7cBpZLswg==" SegmentRef="YiCzQ5ZkTVe+Zn4B2RWINA==" />
                          <air:BookingInfo BookingCode="W" CabinClass="PremiumEconomy" FareInfoRef="RTfQRB0rRgiVM7cBpZLswg==" SegmentRef="VjHDFfxSRVSP5p/lZs1nBw==" />
                          <air:TaxInfo Category="AY" Amount="MXN33" />
                          <air:TaxInfo Category="XA" Amount="MXN66" />
                          <air:TaxInfo Category="XF" Amount="MXN59" />
                          <air:TaxInfo Category="XY" Amount="MXN92" />
                          <air:TaxInfo Category="YC" Amount="MXN72" />
                          <air:TaxInfo Category="XD" Amount="MXN579" />
                          <air:TaxInfo Category="XO" Amount="MXN1006" />
                          <air:TaxInfo Category="YR" Amount="MXN2722" />
                          <air:TaxInfo Category="XF" Amount="USD4.50">
                              <air:TaxDetail Amount="USD4.50" OriginAirport="DTW" />
                          </air:TaxInfo>
                          <air:PassengerType Code="ADT" />
                      </air:AirPricingInfo>
                      <air:Connection SegmentIndex="0" />
                  </air:AirPricingSolution>
                  <air:AirPricingSolution Key="iF9VjnOTR0yWfUUr3E+d8g==" TotalPrice="MXN27042" BasePrice="MXN22413" ApproximateTotalPrice="MXN27042" ApproximateBasePrice="MXN22413" Taxes="MXN4629">
                      <air:Journey TravelTime="P0DT15H24M0S">
                          <air:AirSegmentRef Key="ED9HmzRJQb6ci1sjmqaRGg==" />
                          <air:AirSegmentRef Key="S3o715yxSdOa4PzJZ7BjKw==" />
                      </air:Journey>
                      <air:LegRef Key="PY3n8SmsQi+LfUtVe571VQ==" />
                      <air:AirPricingInfo Key="O8jMKnPdQp6suT0ExBdytg==" TotalPrice="MXN27042" BasePrice="MXN22413" ApproximateTotalPrice="MXN27042" ApproximateBasePrice="MXN22413" Taxes="MXN4629" LatestTicketingTime="2014-04-18T23:59:00.000+00:00" PricingMethod="Auto" Refundable="true" ETicketability="Yes" PlatingCarrier="DL" ProviderCode="1P">
                          <air:FareInfoRef Key="RTfQRB0rRgiVM7cBpZLswg==" />
                          <air:BookingInfo BookingCode="Y" CabinClass="Economy" FareInfoRef="RTfQRB0rRgiVM7cBpZLswg==" SegmentRef="ED9HmzRJQb6ci1sjmqaRGg==" />
                          <air:BookingInfo BookingCode="W" CabinClass="PremiumEconomy" FareInfoRef="RTfQRB0rRgiVM7cBpZLswg==" SegmentRef="S3o715yxSdOa4PzJZ7BjKw==" />
                          <air:TaxInfo Category="AY" Amount="MXN33" />
                          <air:TaxInfo Category="XA" Amount="MXN66" />
                          <air:TaxInfo Category="XF" Amount="MXN59" />
                          <air:TaxInfo Category="XY" Amount="MXN92" />
                          <air:TaxInfo Category="YC" Amount="MXN72" />
                          <air:TaxInfo Category="XD" Amount="MXN579" />
                          <air:TaxInfo Category="XO" Amount="MXN1006" />
                          <air:TaxInfo Category="YR" Amount="MXN2722" />
                          <air:TaxInfo Category="XF" Amount="USD4.50">
                              <air:TaxDetail Amount="USD4.50" OriginAirport="ATL" />
                          </air:TaxInfo>
                          <air:PassengerType Code="ADT" />
                      </air:AirPricingInfo>
                      <air:Connection SegmentIndex="0" />
                  </air:AirPricingSolution>
                  <air:AirPricingSolution Key="bMJ2muoBScSwQEDz5qweVQ==" TotalPrice="MXN27042" BasePrice="MXN22413" ApproximateTotalPrice="MXN27042" ApproximateBasePrice="MXN22413" Taxes="MXN4629">
                      <air:Journey TravelTime="P0DT15H11M0S">
                          <air:AirSegmentRef Key="E3fAoutiTVq0N3Fgf03R9w==" />
                          <air:AirSegmentRef Key="W/lAUE92Qe6LWVoUdXLQGQ==" />
                      </air:Journey>
                      <air:LegRef Key="PY3n8SmsQi+LfUtVe571VQ==" />
                      <air:AirPricingInfo Key="GYs28nJHRn6JSk3WHdutxw==" TotalPrice="MXN27042" BasePrice="MXN22413" ApproximateTotalPrice="MXN27042" ApproximateBasePrice="MXN22413" Taxes="MXN4629" LatestTicketingTime="2014-04-18T23:59:00.000+00:00" PricingMethod="Auto" Refundable="true" ETicketability="Yes" PlatingCarrier="DL" ProviderCode="1P">
                          <air:FareInfoRef Key="RTfQRB0rRgiVM7cBpZLswg==" />
                          <air:BookingInfo BookingCode="Y" CabinClass="Economy" FareInfoRef="RTfQRB0rRgiVM7cBpZLswg==" SegmentRef="E3fAoutiTVq0N3Fgf03R9w==" />
                          <air:BookingInfo BookingCode="W" CabinClass="PremiumEconomy" FareInfoRef="RTfQRB0rRgiVM7cBpZLswg==" SegmentRef="W/lAUE92Qe6LWVoUdXLQGQ==" />
                          <air:TaxInfo Category="AY" Amount="MXN33" />
                          <air:TaxInfo Category="XA" Amount="MXN66" />
                          <air:TaxInfo Category="XF" Amount="MXN59" />
                          <air:TaxInfo Category="XY" Amount="MXN92" />
                          <air:TaxInfo Category="YC" Amount="MXN72" />
                          <air:TaxInfo Category="XD" Amount="MXN579" />
                          <air:TaxInfo Category="XO" Amount="MXN1006" />
                          <air:TaxInfo Category="YR" Amount="MXN2722" />
                          <air:TaxInfo Category="XF" Amount="USD4.50">
                              <air:TaxDetail Amount="USD4.50" OriginAirport="JFK" />
                          </air:TaxInfo>
                          <air:PassengerType Code="ADT" />
                      </air:AirPricingInfo>
                      <air:Connection SegmentIndex="0" />
                  </air:AirPricingSolution>
                  <air:AirPricingSolution Key="OBl5ii1DQ96bR4DhU6O8gg==" TotalPrice="MXN27042" BasePrice="MXN22413" ApproximateTotalPrice="MXN27042" ApproximateBasePrice="MXN22413" Taxes="MXN4629">
                      <air:Journey TravelTime="P0DT15H40M0S">
                          <air:AirSegmentRef Key="bkA7LmDHRDGEqRc0NV4zXQ==" />
                          <air:AirSegmentRef Key="8oNtgdN8QMWR9YfPh2LWxw==" />
                      </air:Journey>
                      <air:LegRef Key="PY3n8SmsQi+LfUtVe571VQ==" />
                      <air:AirPricingInfo Key="UsoomGJJQC2scd56VVX0MA==" TotalPrice="MXN27042" BasePrice="MXN22413" ApproximateTotalPrice="MXN27042" ApproximateBasePrice="MXN22413" Taxes="MXN4629" LatestTicketingTime="2014-04-18T23:59:00.000+00:00" PricingMethod="Auto" Refundable="true" ETicketability="Yes" PlatingCarrier="DL" ProviderCode="1P">
                          <air:FareInfoRef Key="RTfQRB0rRgiVM7cBpZLswg==" />
                          <air:BookingInfo BookingCode="Y" CabinClass="Economy" FareInfoRef="RTfQRB0rRgiVM7cBpZLswg==" SegmentRef="bkA7LmDHRDGEqRc0NV4zXQ==" />
                          <air:BookingInfo BookingCode="W" CabinClass="PremiumEconomy" FareInfoRef="RTfQRB0rRgiVM7cBpZLswg==" SegmentRef="8oNtgdN8QMWR9YfPh2LWxw==" />
                          <air:TaxInfo Category="AY" Amount="MXN33" />
                          <air:TaxInfo Category="XA" Amount="MXN66" />
                          <air:TaxInfo Category="XF" Amount="MXN59" />
                          <air:TaxInfo Category="XY" Amount="MXN92" />
                          <air:TaxInfo Category="YC" Amount="MXN72" />
                          <air:TaxInfo Category="XD" Amount="MXN579" />
                          <air:TaxInfo Category="XO" Amount="MXN1006" />
                          <air:TaxInfo Category="YR" Amount="MXN2722" />
                          <air:TaxInfo Category="XF" Amount="USD4.50">
                              <air:TaxDetail Amount="USD4.50" OriginAirport="JFK" />
                          </air:TaxInfo>
                          <air:PassengerType Code="ADT" />
                      </air:AirPricingInfo>
                      <air:Connection SegmentIndex="0" />
                  </air:AirPricingSolution>
                  <air:AirPricingSolution Key="IaTpUAUITKu2kwgm8VG/AQ==" TotalPrice="MXN29642" BasePrice="MXN24559" ApproximateTotalPrice="MXN29642" ApproximateBasePrice="MXN24559" Taxes="MXN5083">
                      <air:Journey TravelTime="P0DT16H50M0S">
                          <air:AirSegmentRef Key="s3Z5h7S7RzyyWoIk7c9H4A==" />
                          <air:AirSegmentRef Key="fkgTljM1Tu663iEQuZ6b+A==" />
                          <air:AirSegmentRef Key="GhHFq5ZxSf2dLzxgfp/VQA==" />
                      </air:Journey>
                      <air:LegRef Key="PY3n8SmsQi+LfUtVe571VQ==" />
                      <air:AirPricingInfo Key="v++LsS5uRVu2gSHpXzXMNQ==" TotalPrice="MXN29642" BasePrice="MXN24559" ApproximateTotalPrice="MXN29642" ApproximateBasePrice="MXN24559" Taxes="MXN5083" LatestTicketingTime="2014-05-13T23:59:00.000+00:00" PricingMethod="Auto" Refundable="true" ETicketability="Yes" PlatingCarrier="AA" ProviderCode="1P">
                          <air:FareInfoRef Key="Bjh86MuoQUO0tsTf4juBkw==" />
                          <air:BookingInfo BookingCode="D" CabinClass="Business" FareInfoRef="Bjh86MuoQUO0tsTf4juBkw==" SegmentRef="s3Z5h7S7RzyyWoIk7c9H4A==" />
                          <air:BookingInfo BookingCode="W" CabinClass="PremiumEconomy" FareInfoRef="Bjh86MuoQUO0tsTf4juBkw==" SegmentRef="fkgTljM1Tu663iEQuZ6b+A==" />
                          <air:BookingInfo BookingCode="Y" CabinClass="Economy" FareInfoRef="Bjh86MuoQUO0tsTf4juBkw==" SegmentRef="GhHFq5ZxSf2dLzxgfp/VQA==" />
                          <air:TaxInfo Category="AY" Amount="MXN33" />
                          <air:TaxInfo Category="XA" Amount="MXN66" />
                          <air:TaxInfo Category="XF" Amount="MXN59" />
                          <air:TaxInfo Category="XY" Amount="MXN92" />
                          <air:TaxInfo Category="YC" Amount="MXN72" />
                          <air:TaxInfo Category="XD" Amount="MXN579" />
                          <air:TaxInfo Category="XO" Amount="MXN1086" />
                          <air:TaxInfo Category="UB" Amount="MXN505" />
                          <air:TaxInfo Category="YR" Amount="MXN2591" />
                          <air:TaxInfo Category="XF" Amount="USD4.50">
                              <air:TaxDetail Amount="USD4.50" OriginAirport="DFW" />
                          </air:TaxInfo>
                          <air:PassengerType Code="ADT" />
                      </air:AirPricingInfo>
                      <air:Connection StopOver="true" SegmentIndex="0" />
                      <air:Connection StopOver="true" SegmentIndex="1" />
                  </air:AirPricingSolution>
                  <air:AirPricingSolution Key="Gi77Ah2bQ5GG82YHaL6syQ==" TotalPrice="MXN29642" BasePrice="MXN24559" ApproximateTotalPrice="MXN29642" ApproximateBasePrice="MXN24559" Taxes="MXN5083">
                      <air:Journey TravelTime="P0DT19H5M0S">
                          <air:AirSegmentRef Key="pbjpR/0jQ0SIygoymMQmVQ==" />
                          <air:AirSegmentRef Key="4nU9XVZsRy2vdpecu9w7dw==" />
                          <air:AirSegmentRef Key="IaT0OhHrS4Gaj7JoLu/JEw==" />
                      </air:Journey>
                      <air:LegRef Key="PY3n8SmsQi+LfUtVe571VQ==" />
                      <air:AirPricingInfo Key="epRQBwCiRT2X/BuG+73C5w==" TotalPrice="MXN29642" BasePrice="MXN24559" ApproximateTotalPrice="MXN29642" ApproximateBasePrice="MXN24559" Taxes="MXN5083" LatestTicketingTime="2014-05-13T23:59:00.000+00:00" PricingMethod="Auto" Refundable="true" ETicketability="Yes" PlatingCarrier="AA" ProviderCode="1P">
                          <air:FareInfoRef Key="Bjh86MuoQUO0tsTf4juBkw==" />
                          <air:BookingInfo BookingCode="D" CabinClass="Business" FareInfoRef="Bjh86MuoQUO0tsTf4juBkw==" SegmentRef="pbjpR/0jQ0SIygoymMQmVQ==" />
                          <air:BookingInfo BookingCode="W" CabinClass="PremiumEconomy" FareInfoRef="Bjh86MuoQUO0tsTf4juBkw==" SegmentRef="4nU9XVZsRy2vdpecu9w7dw==" />
                          <air:BookingInfo BookingCode="Y" CabinClass="Economy" FareInfoRef="Bjh86MuoQUO0tsTf4juBkw==" SegmentRef="IaT0OhHrS4Gaj7JoLu/JEw==" />
                          <air:TaxInfo Category="AY" Amount="MXN33" />
                          <air:TaxInfo Category="XA" Amount="MXN66" />
                          <air:TaxInfo Category="XF" Amount="MXN59" />
                          <air:TaxInfo Category="XY" Amount="MXN92" />
                          <air:TaxInfo Category="YC" Amount="MXN72" />
                          <air:TaxInfo Category="XD" Amount="MXN579" />
                          <air:TaxInfo Category="XO" Amount="MXN1086" />
                          <air:TaxInfo Category="UB" Amount="MXN505" />
                          <air:TaxInfo Category="YR" Amount="MXN2591" />
                          <air:TaxInfo Category="XF" Amount="USD4.50">
                              <air:TaxDetail Amount="USD4.50" OriginAirport="ORD" />
                          </air:TaxInfo>
                          <air:PassengerType Code="ADT" />
                      </air:AirPricingInfo>
                      <air:Connection StopOver="true" SegmentIndex="0" />
                      <air:Connection StopOver="true" SegmentIndex="1" />
                  </air:AirPricingSolution>
                  <air:AirPricingSolution Key="DE8loVdGSiWohfUfeMImQQ==" TotalPrice="MXN30397" BasePrice="MXN25448" ApproximateTotalPrice="MXN30397" ApproximateBasePrice="MXN25448" Taxes="MXN4949">
                      <air:Journey TravelTime="P1DT10H20M0S">
                          <air:AirSegmentRef Key="e3+1fKBXSsCY7oHc3fk7Wg==" />
                          <air:AirSegmentRef Key="WHaBZpv+RzmDHUXWBQPsPQ==" />
                      </air:Journey>
                      <air:LegRef Key="PY3n8SmsQi+LfUtVe571VQ==" />
                      <air:AirPricingInfo Key="V28IfW7aQSOMos4XBO43Kg==" TotalPrice="MXN30397" BasePrice="MXN25448" ApproximateTotalPrice="MXN30397" ApproximateBasePrice="MXN25448" Taxes="MXN4949" LatestTicketingTime="2014-04-18T23:59:00.000+00:00" PricingMethod="Auto" ETicketability="Yes" PlatingCarrier="US" ProviderCode="1P">
                          <air:FareInfoRef Key="dBtzNuKWTNaARh6/xvT/nA==" />
                          <air:BookingInfo BookingCode="B" CabinClass="Economy" FareInfoRef="dBtzNuKWTNaARh6/xvT/nA==" SegmentRef="e3+1fKBXSsCY7oHc3fk7Wg==" />
                          <air:BookingInfo BookingCode="B" CabinClass="Economy" FareInfoRef="dBtzNuKWTNaARh6/xvT/nA==" SegmentRef="WHaBZpv+RzmDHUXWBQPsPQ==" />
                          <air:TaxInfo Category="AY" Amount="MXN33" />
                          <air:TaxInfo Category="US" Amount="MXN458" />
                          <air:TaxInfo Category="XA" Amount="MXN66" />
                          <air:TaxInfo Category="XF" Amount="MXN40" />
                          <air:TaxInfo Category="XY" Amount="MXN92" />
                          <air:TaxInfo Category="YC" Amount="MXN72" />
                          <air:TaxInfo Category="XD" Amount="MXN579" />
                          <air:TaxInfo Category="XO" Amount="MXN1018" />
                          <air:TaxInfo Category="YR" Amount="MXN2591" />
                          <air:TaxInfo Category="XF" Amount="USD3.00">
                              <air:TaxDetail Amount="USD3.00" OriginAirport="CLT" />
                          </air:TaxInfo>
                          <air:PassengerType Code="ADT" />
                      </air:AirPricingInfo>
                      <air:Connection SegmentIndex="0" />
                  </air:AirPricingSolution>
                  <air:AirPricingSolution Key="BcFalA9FQ52b/sjfQRsSPw==" TotalPrice="MXN35491" BasePrice="MXN30616" ApproximateTotalPrice="MXN35491" ApproximateBasePrice="MXN30616" Taxes="MXN4875">
                      <air:Journey TravelTime="P0DT13H51M0S">
                          <air:AirSegmentRef Key="1XWwP/UZSq65e+jbEnXTaA==" />
                          <air:AirSegmentRef Key="FDjs+GJYRfuvT0SXzJG4OQ==" />
                      </air:Journey>
                      <air:LegRef Key="PY3n8SmsQi+LfUtVe571VQ==" />
                      <air:AirPricingInfo Key="i4R5YTgkRxaeYde2fmds/g==" TotalPrice="MXN35491" BasePrice="MXN30616" ApproximateTotalPrice="MXN35491" ApproximateBasePrice="MXN30616" Taxes="MXN4875" LatestTicketingTime="2014-07-01T23:59:00.000+00:00" PricingMethod="Auto" Refundable="true" ETicketability="Yes" PlatingCarrier="AF" ProviderCode="1P">
                          <air:FareInfoRef Key="L7M/IbGbQReuzvrz01657Q==" />
                          <air:BookingInfo BookingCode="S" CabinClass="PremiumEconomy" FareInfoRef="L7M/IbGbQReuzvrz01657Q==" SegmentRef="1XWwP/UZSq65e+jbEnXTaA==" />
                          <air:BookingInfo BookingCode="S" CabinClass="PremiumEconomy" FareInfoRef="L7M/IbGbQReuzvrz01657Q==" SegmentRef="FDjs+GJYRfuvT0SXzJG4OQ==" />
                          <air:TaxInfo Category="AY" Amount="MXN33" />
                          <air:TaxInfo Category="XA" Amount="MXN66" />
                          <air:TaxInfo Category="XF" Amount="MXN59" />
                          <air:TaxInfo Category="XY" Amount="MXN92" />
                          <air:TaxInfo Category="YC" Amount="MXN72" />
                          <air:TaxInfo Category="XD" Amount="MXN579" />
                          <air:TaxInfo Category="XO" Amount="MXN1331" />
                          <air:TaxInfo Category="YR" Amount="MXN2643" />
                          <air:TaxInfo Category="XF" Amount="USD4.50">
                              <air:TaxDetail Amount="USD4.50" OriginAirport="DTW" />
                          </air:TaxInfo>
                          <air:PassengerType Code="ADT" />
                      </air:AirPricingInfo>
                      <air:Connection SegmentIndex="0" />
                  </air:AirPricingSolution>
                  <air:AirPricingSolution Key="q6xxLJEYSbO+sH4aTNFeCQ==" TotalPrice="MXN35795" BasePrice="MXN31218" ApproximateTotalPrice="MXN35795" ApproximateBasePrice="MXN31218" Taxes="MXN4577">
                      <air:Journey TravelTime="P0DT10H35M0S">
                          <air:AirSegmentRef Key="q+kGgxxbT16Qn/3IY4g/Ww==" />
                      </air:Journey>
                      <air:LegRef Key="PY3n8SmsQi+LfUtVe571VQ==" />
                      <air:AirPricingInfo Key="7uX+VeuaTZWw/3T95adLeA==" TotalPrice="MXN35795" BasePrice="MXN31218" ApproximateTotalPrice="MXN35795" ApproximateBasePrice="MXN31218" Taxes="MXN4577" LatestTicketingTime="2014-07-01T23:59:00.000+00:00" PricingMethod="Auto" Refundable="true" ETicketability="Yes" PlatingCarrier="AF" ProviderCode="1P">
                          <air:FareInfoRef Key="LwqvL+QMQzaS7c/Dv2M6Ow==" />
                          <air:BookingInfo BookingCode="B" CabinClass="Economy" FareInfoRef="LwqvL+QMQzaS7c/Dv2M6Ow==" SegmentRef="q+kGgxxbT16Qn/3IY4g/Ww==" />
                          <air:TaxInfo Category="XD" Amount="MXN579" />
                          <air:TaxInfo Category="XO" Amount="MXN1355" />
                          <air:TaxInfo Category="YR" Amount="MXN2643" />
                          <air:PassengerType Code="ADT" />
                      </air:AirPricingInfo>
                  </air:AirPricingSolution>
                  <air:AirPricingSolution Key="lP9xRBSASyOjlKXttpbwCw==" TotalPrice="MXN35795" BasePrice="MXN31218" ApproximateTotalPrice="MXN35795" ApproximateBasePrice="MXN31218" Taxes="MXN4577">
                      <air:Journey TravelTime="P0DT10H50M0S">
                          <air:AirSegmentRef Key="8l7vQBoCQRKqENZhoHJt1Q==" />
                      </air:Journey>
                      <air:LegRef Key="PY3n8SmsQi+LfUtVe571VQ==" />
                      <air:AirPricingInfo Key="C1Naff5MT8CqykHBktP2/Q==" TotalPrice="MXN35795" BasePrice="MXN31218" ApproximateTotalPrice="MXN35795" ApproximateBasePrice="MXN31218" Taxes="MXN4577" LatestTicketingTime="2014-07-01T23:59:00.000+00:00" PricingMethod="Auto" Refundable="true" ETicketability="Yes" PlatingCarrier="AF" ProviderCode="1P">
                          <air:FareInfoRef Key="LwqvL+QMQzaS7c/Dv2M6Ow==" />
                          <air:BookingInfo BookingCode="B" CabinClass="Economy" FareInfoRef="LwqvL+QMQzaS7c/Dv2M6Ow==" SegmentRef="8l7vQBoCQRKqENZhoHJt1Q==" />
                          <air:TaxInfo Category="XD" Amount="MXN579" />
                          <air:TaxInfo Category="XO" Amount="MXN1355" />
                          <air:TaxInfo Category="YR" Amount="MXN2643" />
                          <air:PassengerType Code="ADT" />
                      </air:AirPricingInfo>
                  </air:AirPricingSolution>
                  <air:AirPricingSolution Key="ByliwMvzS6O44zJhD9hhUA==" TotalPrice="MXN36081" BasePrice="MXN31218" ApproximateTotalPrice="MXN36081" ApproximateBasePrice="MXN31218" Taxes="MXN4863">
                      <air:Journey TravelTime="P0DT13H40M0S">
                          <air:AirSegmentRef Key="U0A/JC4UT3qRPlmmMjryaA==" />
                          <air:AirSegmentRef Key="ginq6F6+RRG/cdwrkdAAbA==" />
                      </air:Journey>
                      <air:LegRef Key="PY3n8SmsQi+LfUtVe571VQ==" />
                      <air:AirPricingInfo Key="DIR777GYT7Cxh4upgNV3Sg==" TotalPrice="MXN36081" BasePrice="MXN31218" ApproximateTotalPrice="MXN36081" ApproximateBasePrice="MXN31218" Taxes="MXN4863" LatestTicketingTime="2014-04-18T23:59:00.000+00:00" PricingMethod="Auto" Refundable="true" ETicketability="Yes" PlatingCarrier="KL" ProviderCode="1P">
                          <air:FareInfoRef Key="LwqvL+QMQzaS7c/Dv2M6Ow==" />
                          <air:BookingInfo BookingCode="B" CabinClass="Economy" FareInfoRef="LwqvL+QMQzaS7c/Dv2M6Ow==" SegmentRef="U0A/JC4UT3qRPlmmMjryaA==" />
                          <air:BookingInfo BookingCode="Y" CabinClass="Economy" FareInfoRef="LwqvL+QMQzaS7c/Dv2M6Ow==" SegmentRef="ginq6F6+RRG/cdwrkdAAbA==" />
                          <air:TaxInfo Category="XD" Amount="MXN579" />
                          <air:TaxInfo Category="XO" Amount="MXN1355" />
                          <air:TaxInfo Category="CJ" Amount="MXN129" />
                          <air:TaxInfo Category="RN" Amount="MXN121" />
                          <air:TaxInfo Category="VV" Amount="MXN36" />
                          <air:TaxInfo Category="YR" Amount="MXN2643" />
                          <air:PassengerType Code="ADT" />
                      </air:AirPricingInfo>
                      <air:Connection SegmentIndex="0" />
                  </air:AirPricingSolution>
                  <air:AirPricingSolution Key="y9YAdZg0QuSxgueXXdtejw==" TotalPrice="MXN36901" BasePrice="MXN34908" ApproximateTotalPrice="MXN36901" ApproximateBasePrice="MXN34908" Taxes="MXN1993">
                      <air:Journey TravelTime="P0DT10H35M0S">
                          <air:AirSegmentRef Key="jfUf6kVqTVCUcxYVs7wCrQ==" />
                      </air:Journey>
                      <air:LegRef Key="PY3n8SmsQi+LfUtVe571VQ==" />
                      <air:AirPricingInfo Key="t6qSfTJ1TUelNIdmE4M0pw==" TotalPrice="MXN36901" BasePrice="MXN34908" ApproximateTotalPrice="MXN36901" ApproximateBasePrice="MXN34908" Taxes="MXN1993" LatestTicketingTime="2014-05-17T23:59:00.000+00:00" PricingMethod="Auto" Refundable="true" ETicketability="Yes" PlatingCarrier="AM" ProviderCode="1P">
                          <air:FareInfoRef Key="JifHcTMwTzmwJe8Sqd86Pw==" />
                          <air:BookingInfo BookingCode="B" CabinClass="Economy" FareInfoRef="JifHcTMwTzmwJe8Sqd86Pw==" SegmentRef="jfUf6kVqTVCUcxYVs7wCrQ==" />
                          <air:TaxInfo Category="XD" Amount="MXN579" />
                          <air:TaxInfo Category="XO" Amount="MXN1397" />
                          <air:TaxInfo Category="YR" Amount="MXN17" />
                          <air:PassengerType Code="ADT" />
                      </air:AirPricingInfo>
                  </air:AirPricingSolution>
                  <air:AirPricingSolution Key="E1jLfc9PQu6FjPfMLP3SFA==" TotalPrice="MXN36901" BasePrice="MXN34908" ApproximateTotalPrice="MXN36901" ApproximateBasePrice="MXN34908" Taxes="MXN1993">
                      <air:Journey TravelTime="P0DT10H50M0S">
                          <air:AirSegmentRef Key="BwhOKJ5QTHKZRgDOZAg7VA==" />
                      </air:Journey>
                      <air:LegRef Key="PY3n8SmsQi+LfUtVe571VQ==" />
                      <air:AirPricingInfo Key="+lTsXYv0Qfyb4FhNk5PDaA==" TotalPrice="MXN36901" BasePrice="MXN34908" ApproximateTotalPrice="MXN36901" ApproximateBasePrice="MXN34908" Taxes="MXN1993" LatestTicketingTime="2014-05-17T23:59:00.000+00:00" PricingMethod="Auto" Refundable="true" ETicketability="Yes" PlatingCarrier="AM" ProviderCode="1P">
                          <air:FareInfoRef Key="JifHcTMwTzmwJe8Sqd86Pw==" />
                          <air:BookingInfo BookingCode="B" CabinClass="Economy" FareInfoRef="JifHcTMwTzmwJe8Sqd86Pw==" SegmentRef="BwhOKJ5QTHKZRgDOZAg7VA==" />
                          <air:TaxInfo Category="XD" Amount="MXN579" />
                          <air:TaxInfo Category="XO" Amount="MXN1397" />
                          <air:TaxInfo Category="YR" Amount="MXN17" />
                          <air:PassengerType Code="ADT" />
                      </air:AirPricingInfo>
                  </air:AirPricingSolution>
                  <air:BrandList>
                      <air:Brand Key="LjIrOz+gRoKbtr3o7DJuHg==" BrandID="3917" Name="Economy" BrandedDetailsAvailable="true">
                          <air:Title Type="Short">Economy</air:Title>
                          <air:Title Type="External">Economy</air:Title>
                          <air:Text Type="Upsell">EASE INTO AN ECONOMY FARE Add more convenience Select your seat in advanceChange flights when plans change</air:Text>
                          <air:Text Type="Strapline">Low affordable fare with perks</air:Text>
                          <air:ImageLocation Type="Agent" ImageWidth="150" ImageHeight="150">https://merchandisingmanagement.pp.travelport.com/documents/10431/12001/economy.png</air:ImageLocation>
                      </air:Brand>
                      <air:Brand Key="40z6+sPaTd+OONef5mz9lA==" BrandID="3918" Name="FIRST BUSINESS" BrandedDetailsAvailable="true">
                          <air:Title Type="Short">F/BUS</air:Title>
                          <air:Title Type="External">FIRST/BUSINESS</air:Title>
                          <air:Text Type="Upsell">MOVE UP TO FIRST CLASS You deserve the luxury Attentive service, luxurious surroundingsFirst on, first offMore free checked bags</air:Text>
                          <air:Text Type="Strapline">First on, First off and More free checked bags</air:Text>
                          <air:ImageLocation Type="Agent" ImageWidth="150" ImageHeight="150">https://merchandisingmanagement.pp.travelport.com/documents/10431/12001/first%20bus.png</air:ImageLocation>
                      </air:Brand>
                  </air:BrandList>
              </air:LowFareSearchRsp>
          </SOAP:Body>
      </SOAP:Envelope>
    template
  end
end
