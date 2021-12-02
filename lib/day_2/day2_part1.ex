defmodule Day2Part1 do
  def part1 do
    {:ok, input} = File.read('lib/day_2/input/part1.txt')

    steps = parse_input(input)

    steps
    |> Enum.reduce({0, 0}, fn step, acc ->
      new_position(acc, step)
    end)
  end

  def new_position(_position = {hor, depth}, _step = {"forward", amount}) do
    {hor + amount, depth}
  end

  def new_position(_position = {hor, depth}, _step = {"up", amount}) do
    {hor, depth - amount}
  end

  def new_position(_position = {hor, depth}, _step = {"down", amount}) do
    {hor, depth + amount}
  end

  def new_position(position, _) do
    position
  end

  defp parse_input(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn line ->
      [step, amount] = String.split(line, " ")
      {step, String.to_integer(amount)}
    end)
  end
end
