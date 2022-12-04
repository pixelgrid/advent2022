defmodule AdventOfCode2022_Day4 do
  @input_data File.read!('./inputs/day4') |> String.split("\n", trim: true)
  defp get_parts_as_integers row do
    row
    |> String.split([",", "-"])
    |> Enum.map(&String.to_integer/1)
  end
  defp check_complete_range_overlap [s1, e1, s2, e2] do
    cond do
      s1 >= s2 && e1 <= e2 -> 1
      s2 >= s1 && e2 <= e1 -> 1
      true -> 0
    end
  end
  defp check_partial_range_overlap [s1, e1, s2, e2] do
    if max(s1, s2) <= min(e1, e2), do: 1, else: 0
  end
  def day4_a do
    @input_data
      |> Enum.map(&get_parts_as_integers/1)
      |> Enum.map(&check_complete_range_overlap/1)
      |> Enum.sum
  end
  def day4_b do
    @input_data
      |> Enum.map(&get_parts_as_integers/1)
      |> Enum.map(&check_partial_range_overlap/1)
      |> Enum.sum
  end
end

IO.puts AdventOfCode2022_Day4.day4_a
IO.puts AdventOfCode2022_Day4.day4_b
