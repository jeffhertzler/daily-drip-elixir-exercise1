defmodule Exercise1Test do
  use ExUnit.Case
  doctest Exercise1

  test "responds to a string message and returns the string upcased" do
    {:ok, pid} = Exercise1.start
    assert {:ok, "SOME STRING"} = Exercise1.upcase(pid, "some string")
  end
  test "responds to a multiple messages" do
    {:ok, pid} = Exercise1.start
    assert {:ok, "SOME STRING"} = Exercise1.upcase(pid, "some string")
    assert {:ok, "SOME STRING"} = Exercise1.upcase(pid, "some string")
  end
end
