defmodule WhoDdosedMeTest do
  use ExUnit.Case
  doctest WhoDdosedMe

  defmodule FileDispenserMock do
    def gets(_) do
      "file.log sample ~/long/name/very"
    end
  end

  test "Get and split files" do
    assert WhoDdosedMe.FileHandler.get_files_to_process(FileDispenserMock) == ["file.log", "sample", "~/long/name/very"]
  end
end
