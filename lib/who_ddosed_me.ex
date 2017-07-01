defmodule WhoDdosedMe do

  alias WhoDdosedMe.FileHandler

  @valid_opts [
    async: :boolean,
    adapter: :string,
    output: :string
  ]

  def main(args) do
    options = parse_options(args)
    case Keyword.get(options,:adapter) do
      nil -> IO.puts("No adapter specified")
      adapter ->
        adapter_module = WhoDdosedMe.AnalyzerPort.adapter(adapter)
        FileHandler.get_files_to_process
        |> FileHandler.handle_file(adapter_module)
    end
    |> Poison.encode!()
    |> IO.puts()
  end

  def parse_options(args) do
    {ops, _, _}  = OptionParser.parse(args, switches: @valid_opts)
    ops
  end

end
