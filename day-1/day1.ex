defmodule Day1 do
  def part1 do
    {:ok, input} = File.read("input-day1.txt")

    lines = input_to_list(input)
    increase_count = total_increases(lines)
  end

  def total_increases(list) do
    list
    |> Enum.with_index()
    |> Enum.reduce(0, fn {depth, index}, acc ->
      previousDepth = Enum.at(list, index - 1)
      IO.inspect(previousDepth)

      cond do
        index == 0 -> acc
        previousDepth < depth -> acc + 1
        true -> acc
      end
    end)
  end

  def part2 do
    {:ok, input} = File.read("input-part2.txt")
    lines = input_to_list(input)

    three_window_sums =
      lines
      |> Enum.with_index()
      |> Enum.map(fn {depth, index} ->
        next = Enum.at(lines, index + 1)
        next2 = Enum.at(lines, index + 2)

        sum_of_window(depth, next, next2)
      end)

    IO.inspect(three_window_sums)

    increase_count = total_increases(three_window_sums)
    # IO.puts(totalIncreases)
  end

  defp sum_of_window(first, nil, nil), do: 0
  defp sum_of_window(first, second, nil), do: 0

  defp sum_of_window(first, second, third) do
    first + second + third
  end

  defp input_to_list(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn line -> String.to_integer(line) end)
  end
end
