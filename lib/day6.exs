defmodule AdventOfCode2022_Day6 do
  @input_data File.read!("./inputs/day6")
  @packet_marker_size 4
  @message_marker_size 14
  defp split_by_window_size(window_size) do
    @input_data
    |> String.graphemes()
    |> Enum.chunk_every(window_size, 1, :discard)
    |> Enum.with_index()
  end

  defp check_for_unique_letters(chunks, window_size) do
    Enum.reduce_while(chunks, 0, fn {chunk, index}, _acc ->
      case Enum.count(MapSet.new(chunk)) do
        ^window_size -> {:halt, index + window_size}
        _ -> {:cont, nil}
      end
    end)
  end

  def day6_a do
    split_by_window_size(@packet_marker_size)
    |> check_for_unique_letters(@packet_marker_size)
  end

  def day6_b do
    split_by_window_size(@message_marker_size)
    |> check_for_unique_letters(@message_marker_size)
  end
end

IO.puts(AdventOfCode2022_Day6.day6_a())
IO.puts(AdventOfCode2022_Day6.day6_b())
