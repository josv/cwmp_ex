defmodule CWMP.Protocol.Generator.GetOptionsResponseTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:GetOptionsResponse>
\t\t\t<OptionList SOAP-ENC:arrayType="cwmp:OptionStruct[2]">
\t\t\t\t<OptionStruct>
\t\t\t\t\t<OptionName>First Option</OptionName>
\t\t\t\t\t<VoucherSN>12345678</VoucherSN>
\t\t\t\t\t<State>1</State>
\t\t\t\t\t<Mode>1</Mode>
\t\t\t\t\t<StartDate>2015-01-10T23:45:12+00:00</StartDate>
\t\t\t\t\t<ExpirationDate>2015-01-10T23:45:12+00:00</ExpirationDate>
\t\t\t\t\t<IsTransferable>1</IsTransferable>
\t\t\t\t</OptionStruct>
\t\t\t\t<OptionStruct>
\t\t\t\t\t<OptionName>Second Option</OptionName>
\t\t\t\t\t<VoucherSN>12345678</VoucherSN>
\t\t\t\t\t<State>1</State>
\t\t\t\t\t<Mode>1</Mode>
\t\t\t\t\t<StartDate>2015-01-10T23:45:12+00:00</StartDate>
\t\t\t\t\t<ExpirationDate>2015-01-10T23:45:12+00:00</ExpirationDate>
\t\t\t\t\t<IsTransferable>1</IsTransferable>
\t\t\t\t</OptionStruct>
\t\t\t</OptionList>
\t\t</cwmp:GetOptionsResponse>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates GetOptionsResonse" do
    assert(CWMP.Protocol.Generator.get_options_response(
      %CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},
      %CWMP.Protocol.Messages.GetOptionsResponse{
        optionlist: [
          %CWMP.Protocol.Messages.OptionStruct{
            option_name: "First Option",
            voucher_sn: "12345678",
            state: 1,
            mode: 1,
            start_date: %Timex.DateTime{calendar: :gregorian,
          day: 10, hour: 23, minute: 45, month: 1, millisecond: 0, second: 12,
          timezone: %Timex.TimezoneInfo{abbreviation: "UTC", from: :min,
            full_name: "UTC", offset_std: 0, offset_utc: 0, until: :max}, year: 2015},
            expiration_date: %Timex.DateTime{calendar: :gregorian,
          day: 10, hour: 23, minute: 45, month: 1, millisecond: 0, second: 12,
          timezone: %Timex.TimezoneInfo{abbreviation: "UTC", from: :min,
            full_name: "UTC", offset_std: 0, offset_utc: 0, until: :max}, year: 2015},
            is_transferable: true},
          %CWMP.Protocol.Messages.OptionStruct{
            option_name: "Second Option",
            voucher_sn: "12345678",
            state: 1,
            mode: 1,
            start_date: %Timex.DateTime{calendar: :gregorian,
          day: 10, hour: 23, minute: 45, month: 1, millisecond: 0, second: 12,
          timezone: %Timex.TimezoneInfo{abbreviation: "UTC", from: :min,
            full_name: "UTC", offset_std: 0, offset_utc: 0, until: :max}, year: 2015},
            expiration_date: %Timex.DateTime{calendar: :gregorian,
          day: 10, hour: 23, minute: 45, month: 1, millisecond: 0, second: 12,
          timezone: %Timex.TimezoneInfo{abbreviation: "UTC", from: :min,
            full_name: "UTC", offset_std: 0, offset_utc: 0, until: :max}, year: 2015},
            is_transferable: true}]}) == @sample)
  end

end
