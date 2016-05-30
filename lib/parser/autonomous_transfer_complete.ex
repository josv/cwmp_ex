defmodule CWMP.Protocol.Parser.Messages.AutonomousTransferComplete do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.AutonomousTransferComplete

  def initial_acc do
    %AutonomousTransferComplete{}
  end

  def start_element(state, ['FaultStruct'], _attribs) do
    push_handler(state, FaultStruct)
  end

  def end_element(state, ['FaultStruct']) do
    update_acc(state, fn acc -> %AutonomousTransferComplete{acc | fault_struct: state.last_acc} end)
  end

  @accepted_time_formats ["{YYYY}-{0M}-{0D}T{0h24}:{0m}:{0s}",
                          "{YYYY}-{0M}-{0D}T{0h24}:{0m}:{0s}{Z:}",
                          "{YYYY}-{0M}-{0D}T{0h24}:{0m}:{0s}Z"]
  def end_element(state, ['StartTime']) do
    times = @accepted_time_formats
    |> Enum.map(&Timex.Parse.DateTime.Parser.parse(state.last_text, &1))
    |> Enum.filter(fn
      {:ok, _} -> true
      _ -> false
    end)
    case times do
      [{:ok, val} | _] -> update_acc(state, fn cur -> %AutonomousTransferComplete{cur | start_time: val} end)
      _ -> raise "StartTime '#{state.last_text}' has unacceptable format"
    end
  end

  def end_element(state, ['CompleteTime']) do
    times = @accepted_time_formats
    |> Enum.map(&Timex.Parse.DateTime.Parser.parse(state.last_text, &1))
    |> Enum.filter(fn
      {:ok, _} -> true
      _ -> false
    end)
    case times do
      [{:ok, val} | _] -> update_acc(state, fn cur -> %AutonomousTransferComplete{cur | complete_time: val} end)
      _ -> raise "CompleteTime '#{state.last_text}' has unacceptable format"
    end
  end

  def end_element(state, ['AnnounceURL']) do
    update_acc(state, fn cur -> %AutonomousTransferComplete{cur | announce_url: state.last_text} end)
  end

  def end_element(state, ['TransferURL']) do
    update_acc(state, fn cur -> %AutonomousTransferComplete{cur | transfer_url: state.last_text} end)
  end

  def end_element(state, ['FileType']) do
    update_acc(state, fn cur -> %AutonomousTransferComplete{cur | filetype: state.last_text} end)
  end

  def end_element(state, ['FileSize']) do
    case Integer.parse(state.last_text) do
      {val, ""} when val >= 0 -> update_acc(state, fn cur -> %AutonomousTransferComplete{cur | filesize: val} end)
      _ -> raise "Invalid filesize"
    end
  end

  def end_element(state, ['TargetFileName']) do
    update_acc(state, fn cur -> %AutonomousTransferComplete{cur | target_filename: state.last_text} end)
  end

  def end_element(state, ['IsDownload']) do
      val = case state.last_text do
        "0" -> false
        "1" -> true
        _ -> raise "Invalid value '#{state.last_text}' for is_download"
      end
      update_acc(state, fn cur -> %AutonomousTransferComplete{cur | is_download: val} end)
  end
end

