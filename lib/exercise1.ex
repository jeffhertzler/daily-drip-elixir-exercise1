defmodule Exercise1 do
  @moduledoc """
  Documentation for Exercise1.
  """

  def start do
    pid = spawn(Exercise1, :loop, [])
    {:ok, pid}
  end

  def upcase(pid, str) do
    ref = make_ref()
    send(pid, {self(), ref, {:upcase, str}})
    receive do
      {:ok, ^ref, str} -> {:ok, str}
    end
  end

  def loop do
    receive do
      {from, ref, {:upcase, str}} -> send(from, {:ok, ref, String.upcase(str)})
    end
    loop()
  end
end
