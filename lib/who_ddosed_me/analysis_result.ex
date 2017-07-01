defmodule WhoDdosedMe.AnalysisResult do
  defstruct ip: nil, extras: [%{}], count: 0
end

defmodule WhoDdosedMe.ScanResult do
  defstruct ip: "", extra: %{}

  def package_scan_result({ip,record}) do
    {extras, length } = extras = Enum.reduce(record, {[] , 0}, fn result, {acc, count} ->
      { result.extras ++ acc, count + 1}
    end)
    %WhoDdosedMe.AnalysisResult{ip:  ip, extras: extras , count:  length}
  end
end
