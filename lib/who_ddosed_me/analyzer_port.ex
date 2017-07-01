defmodule WhoDdosedMe.AnalyzerPort do
  @callback parse(String.t) :: any

  def adapter("sshlogin"), do: WhoDdosedMe.SSHAnalyzerAdapter

end
