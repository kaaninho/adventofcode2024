defmodule Day1 do
  @moduledoc """
  Documentation for `Advent`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Advent.hello()
      :world

  """
  def hello do
    {:ok, input} = File.read("ex1.txt")

    tuples =
      input
      |> String.split("\n")
      |> Enum.map(fn a ->
        [x, y] = a |> String.split("   ")
        [x, y]
      end)

    firstList =
      tuples
      |> Enum.map(fn [x, _] ->
        {a, _} = Integer.parse(x)
        a
      end)
      |> Enum.sort()

    secondList =
      tuples
      |> Enum.map(fn [_, y] ->
        {a, _} = Integer.parse(y)
        a
      end)
      |> Enum.sort()

    Enum.zip(firstList, secondList)
    |> IO.inspect()
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.reduce(fn a, b -> a + b end)
    |> IO.inspect()
  end
end
