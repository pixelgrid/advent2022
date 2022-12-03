defmodule AdventOfCode2022_Day3 do
  @input_data File.read!('./inputs/day3') |> String.split("\n", trim: true)
  
  defp get_item_priority(item) do
    cond do
      item in ?a..?z -> rem(item, ?a) + 1
      item in ?A..?Z -> rem(item, ?A) + 27
    end
  end
  defp get_duplicate(rucksack_items) do
    len = byte_size(rucksack_items)
    rucksack_items
      |> to_charlist
      |> Enum.chunk_every(div(len, 2))
      |> Enum.map(&MapSet.new/1)
      |> Enum.reduce(&MapSet.intersection/2)
      |> Enum.at(0)
  end
  def day3_a do
    @input_data
      |> Enum.reduce(0, fn (rucksack_items, sum) -> 
        rucksack_items
          |> get_duplicate
          |> get_item_priority()
          |> Kernel.+(sum)
      end)
  end
  def day3_b do
    @input_data
      |> Enum.chunk_every(3)
      |> Enum.reduce(0, fn(chunk, sum) -> 
        chunk
          |> Enum.map(&to_charlist/1)
          |> Enum.map(&MapSet.new/1)
          |> Enum.reduce(&MapSet.intersection/2)
          |> Enum.at(0)
          |> get_item_priority
          |> Kernel.+(sum)
      end)
  end
end

IO.puts("Day3-A answer. The sum of the priorities of the duplicate items is: #{AdventOfCode2022_Day3.day3_a}")
IO.puts("Day3-B answer. The sum of the priorities of the group badges is: #{AdventOfCode2022_Day3.day3_b}")
