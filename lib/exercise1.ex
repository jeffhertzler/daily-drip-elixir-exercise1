defmodule Exercise1 do
  @moduledoc """
  Documentation for Exercise1.
  """

  def start do
    pid = spawn(Exercise1, :loop, [])
    {:ok, pid}
  end

  def upcase(pid, str) do
    send(pid, {self(), {:upcase, str}})
    receive do
      {:ok, str} -> {:ok, str}
    end
  end

  def loop do
    receive do
      {from, {:upcase, str}} -> send(from, {:ok, String.upcase(str)})
    end
    loop()
  end
end
