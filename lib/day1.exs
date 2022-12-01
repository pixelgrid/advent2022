defmodule AdventOfCode2022_Day1 do
  @input_data File.read!("./inputs/day1_a")
  @moduledoc """
    Day 1 of 2022 advent of code
    https://adventofcode.com/2022/day/1
  """

  def day1_a do
    @input_data
    |> String.split("\n\n", trim: true)
    |> Enum.reduce(0, fn (calories, max_current) -> 
      calories
      |> String.split("\n", trim: true)
      |> Enum.map(fn calories -> String.to_integer(calories) end)
      |> Enum.sum
      |> Kernel.max(max_current)
    end)
  end

  def day1_b do
    @input_data
    |> String.split("\n\n", trim: true)
    |> Enum.map(fn calories -> 
      calories
      |> String.split("\n", trim: true)
      |> Enum.map(fn calories -> String.to_integer(calories) end)
      |> Enum.sum
    end)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum
  end
end

IO.puts("Day1-A answer. The most calories carried by a single elf are: #{AdventOfCode2022_Day1.day1_a}")
IO.puts("Day1-B answer. The amount of calories carried by the 3 elves having the most calories are: #{AdventOfCode2022_Day1.day1_b}")
