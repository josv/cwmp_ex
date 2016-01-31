defmodule CWMP.Protocol.Parser.InformTest do
  use ExUnit.Case, async: true

  @sample_2601 """
  <SOAP-ENV:Envelope
    SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:cwmp="urn:dslforum-org:cwmp-1-0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <SOAP-ENV:Header>
      <cwmp:ID SOAP-ENV:mustUnderstand="1">100</cwmp:ID>
      <cwmp:HoldRequests SOAP-ENV:mustUnderstand="1">1</cwmp:HoldRequests>
      <cwmp:SessionTimeout SOAP-ENV:mustUnderstand="1">1</cwmp:SessionTimeout>
      <cwmp:Fucktard SOAP-ENV:mustUnderstand="0">1</cwmp:Fucktard>
    </SOAP-ENV:Header>
    <SOAP-ENV:Body>
      <cwmp:Inform>
        <DeviceId>
          <Manufacturer>ZyXEL</Manufacturer>
          <OUI>EC43F6</OUI>
          <ProductClass>P-2601HN-F1</ProductClass>
          <SerialNumber>EC43F69AF408</SerialNumber>
        </DeviceId>
        <Event SOAP-ENC:arrayType="cwmp:EventStruct[1]">
          <EventStruct>
            <EventCode>2 PERIODIC</EventCode>
            <CommandKey></CommandKey>
          </EventStruct>
        </Event>
        <MaxEnvelopes>1</MaxEnvelopes>
        <CurrentTime>2015-01-19T23:08:24</CurrentTime>
        <RetryCount>0</RetryCount>
        <ParameterList SOAP-ENC:arrayType="cwmp:ParameterValueStruct[8]">
          <ParameterValueStruct>
            <Name>InternetGatewayDevice.DeviceSummary</Name>
            <Value xsi:type="xsd:string">InternetGatewayDevice:1.4[](Baseline:1, EthernetLAN:1, WiFiLAN:1, EthernetWAN:1, ADSLWAN:1, IPPing:1, DSLDiagnostics:1, Time:1), VoiceService:1.0[1](Endpoint:1, SIPEndpoint:1)</Value>
          </ParameterValueStruct>
          <ParameterValueStruct>
            <Name>InternetGatewayDevice.DeviceInfo.SpecVersion</Name>
            <Value xsi:type="xsd:string">1.0</Value>
          </ParameterValueStruct>
          <ParameterValueStruct>
            <Name>InternetGatewayDevice.DeviceInfo.HardwareVersion</Name>
            <Value xsi:type="xsd:string">P-2601HN-F1</Value>
          </ParameterValueStruct>
          <ParameterValueStruct>
            <Name>InternetGatewayDevice.DeviceInfo.SoftwareVersion</Name>
            <Value xsi:type="xsd:string">V1.00(AACB.3)</Value>
          </ParameterValueStruct>
          <ParameterValueStruct>
            <Name>InternetGatewayDevice.DeviceInfo.ProvisioningCode</Name>
            <Value xsi:type="xsd:string"></Value>
          </ParameterValueStruct>
          <ParameterValueStruct>
            <Name>InternetGatewayDevice.ManagementServer.ConnectionRequestURL</Name>
            <Value xsi:type="xsd:string">http://2.110.157.83:7676/CWMP/ConnectionRequest</Value>
          </ParameterValueStruct>
          <ParameterValueStruct>
            <Name>InternetGatewayDevice.ManagementServer.ParameterKey</Name>
            <Value xsi:type="xsd:string"></Value>
          </ParameterValueStruct>
          <ParameterValueStruct>
            <Name>InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANIPConnection.1.ExternalIPAddress</Name>
            <Value xsi:type="xsd:string">2.110.157.83</Value>
          </ParameterValueStruct>
        </ParameterList>
      </cwmp:Inform>
    </SOAP-ENV:Body>
  </SOAP-ENV:Envelope>
  """

  test "parses 2601 inform" do
    require Logger
    ret = CWMP.Protocol.Parser.parse! @sample_2601
    Logger.debug "#{inspect ret, pretty: true}"
  end

end
