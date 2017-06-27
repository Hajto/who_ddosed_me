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
    |> Stream.map(&adapter.parser/1)
  end
end
