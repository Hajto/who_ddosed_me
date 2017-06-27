defmodule WhoDdosedMe do

  @valid_opts [
    async: :boolean
  ]

  def main(args) do

  end

  def parse_options(args) do
    {ops, _, _}  = OptionParser.parse(args, switches: @valid_opts)
    ops
  end

end
