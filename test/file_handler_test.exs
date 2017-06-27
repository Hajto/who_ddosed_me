defmodule WhoDdosedMe.FileHandlerTest do
  use ExUnit.Case

  alias WhoDdosedMe.AnalysisResult, as: Result

  defmodule TestAdapter do
    def parse("foo"), do: {:ok, %Result{ip: "1"} }
    def parse("bar"), do: {:ok, %Result{ip: "2"} }
    def parse(_), do: {:error, :invalid_data}
  end

  @test_data ["foo", "bar", "foo", "wrong"]

  test "Parses each line" do
    results = WhoDdosedMe.FileHandler.process_file(@test_data, TestAdapter)
    assert length(results) == 3
  end

end
