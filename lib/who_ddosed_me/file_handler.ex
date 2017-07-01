defmodule WhoDdosedMe.FileHandler do
  def get_files_to_process(io \\ IO) do
    io.gets("")
    |> String.replace("\n", "")
    |> String.split(" ")
  end

  def handle_file(name, adapter) do
    File.stream!(name)
    |> process_file(adapter)
  end

  def process_file(file, adapter) do
    file
    |> Stream.map(&adapter.parse/1)
    |> Stream.filter(&result_cryterium/1)
    |> Stream.map(fn {:ok, elem} -> elem end)
    |> Enum.to_list
  end

  defp result_cryterium({:ok, _}), do: true
  defp result_cryterium(_), do: false
end
