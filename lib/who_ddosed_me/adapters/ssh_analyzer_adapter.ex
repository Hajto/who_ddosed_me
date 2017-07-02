defmodule WhoDdosedMe.SSHAnalyzerAdapter do
  @behaviour WhoDdosedMe.AnalyzerPort

  @regex ~r/([\w]+ \d{1,2} \d{1,2}:\d{1,2}:\d{1,2}) .+? (\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}) port (\d{1,9})/

  def parse(line) do
    case Regex.run(@regex, line) do
      [_, time, ip, port] ->
        {:ok, %WhoDdosedMe.ScanResult{ip: ip, extra: %{time: time, port: port}} }
      _ -> {:error, :invalid_log}
    end

  end

end
