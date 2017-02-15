defmodule Exercise1Test do
  use ExUnit.Case
  doctest Exercise1

  test "responds to a string message and returns the string upcased" do
    pid = spawn(Exercise1, :start, [])
    send(pid, {"some string", self()})
    assert_receive({:ok, "SOME STRING"})
  end
  test "responds to a multiple messages" do
    pid = spawn(Exercise1, :start, [])
    send(pid, {"some string", self()})
    assert_receive({:ok, "SOME STRING"})
    send(pid, {"some string", self()})
    assert_receive({:ok, "SOME STRING"})
  end
end
