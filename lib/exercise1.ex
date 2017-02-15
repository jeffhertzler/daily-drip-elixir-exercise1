defmodule Exercise1 do
  @moduledoc """
  Documentation for Exercise1.
  """

  def start do
    loop()
  end

  def loop do
    receive do
      {string, from} -> send(from, {:ok, String.upcase(string)})
    end
    loop()
  end
end