defmodule CWMP.Protocol.Parser.Messages.RebootResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.RebootResponse

  def initial_acc do
    %RebootResponse{}
  end
end

