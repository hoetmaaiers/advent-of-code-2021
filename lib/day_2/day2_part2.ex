defmodule Day2Part2 do
  def run do
    {:ok, input} = File.read('lib/day_2/input/part1.txt')
    steps = parse_input(input)
    start_position = {0, 0, 0}

    final_position =
      steps
      |> Enum.reduce(start_position, fn step, acc ->
        new_position(acc, step)
      end)

    {final_hor, final_depth, _} = final_position
    IO.puts("Final position, horizontal: #{final_hor} - depth: #{final_depth}")
    IO.puts("Result: #{final_hor * final_depth}")
  end

  def new_position({hor, depth, aim}, {"forward", amount}) do
    {hor + amount, depth + aim * amount, aim}
  end

  def new_position({hor, depth, aim}, {"up", amount}) do
    {hor, depth, aim - amount}
  end

  def new_position({hor, depth, aim}, {"down", amount}) do
    {hor, depth, aim + amount}
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
