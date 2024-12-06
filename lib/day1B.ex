defmodule Day1B do
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

    secondList =
      tuples
      |> Enum.map(fn [_, y] ->
        {a, _} = Integer.parse(y)
        a
      end)

    firstList
    |> Enum.map(fn el ->
      a = Enum.filter(secondList, fn al -> al == el end) |> Enum.count()
      el * a
    end)
    |> Enum.reduce(fn a, b -> a + b end)
  end
end
