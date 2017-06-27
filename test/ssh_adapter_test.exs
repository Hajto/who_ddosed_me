defmodule SSHAnalyzerAdapterTest do
  use ExUnit.Case

  @sample_valid_log "Jun 18 06:32:44 vps346970 sshd[9249]: Failed password for root from 221.122.101.203 port 51041 ssh2"

  test "Parses valid log" do
    {:ok, result } = WhoDdosedMe.SSHAnalyzerAdapter.parse(@sample_valid_log)
    assert result.ip == "221.122.101.203"
    assert result.extras[:port] == "51041"
  end
end
