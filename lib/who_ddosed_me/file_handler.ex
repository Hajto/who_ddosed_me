defmodule WhoDdosedMe.FileHandler do
  def get_files_to_process(io \\ IO) do
    io.gets("")
    |> String.replace("\n", "")
    |> String.split(" ")
  end

  def handle_multiple_files(files, adapter_module) do
    Enum.map(files, fn name ->
      records =
        handle_file(name,adapter_module)
        |> Enum.sort_by(&(&1.count), &>=/2)
      %{name => records}
    end)
  end

  def handle_file(name, adapter) do
    File.stream!(name)
    |> process_file(adapter)
  end

  def process_file(file, adapter) do
    file
    |> Flow.from_enumerable()
    |> Flow.map(&adapter.parse/1)
    |> Flow.filter(&result_cryterium/1)
    |> Flow.map(fn {:ok, elem} -> elem end)
    |> Flow.partition()
    |> Flow.group_by(&(&1.ip))
    |> Flow.map(&WhoDdosedMe.ScanResult.package_scan_result/1)
    |> Enum.to_list
  end

  defp result_cryterium({:ok, _}), do: true
  defp result_cryterium(_), do: false
end
