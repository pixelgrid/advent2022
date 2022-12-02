defmodule AdventOfCode2022_Day2 do
  @input_data File.read!('./inputs/day2') |> String.split("\n", trim: true)
  @draw_points 3
  @win_points 6
  @loss_points 0
  @mapping %{
    ?A => %{
      previous: ?C,
      next: ?B,
    },
    ?B => %{
      previous: ?A,
      next: ?C,
    },
    ?C => %{
      previous: ?B,
      next: ?A,
    },
  }
  defp outcome_in_points(opponents_choice, our_choice) do
    case rem(our_choice, ?X) - rem(opponents_choice, ?A) do
      0 -> @draw_points
      1 -> @win_points
      -1 -> @loss_points
      2 -> @loss_points
      -2 -> @win_points
    end
  end
  defp field_as_choice(opponents_choice, our_choice) do
    rem(our_choice, ?X) + 1 + outcome_in_points(opponents_choice, our_choice)
  end
  defp field_as_outcome(opponents_choice, outcome) do
    # X loss, Y draw, Z win
    case outcome do
      ?X -> rem(@mapping[opponents_choice].previous, ?A) + @loss_points
      ?Y -> rem(opponents_choice, ?A) + @draw_points
      ?Z -> rem(@mapping[opponents_choice].next, ?A) + @win_points
    end + 1
  end
  def day2_a do
    @input_data
      |> Enum.reduce(0, fn (<<opponents_choice, " ", our_choice>>, result) ->
        result + field_as_choice(opponents_choice, our_choice)
      end)
  end
  def day2_b do
    @input_data
      |> Enum.reduce(0, fn (<<opponents_choice, " ", outcome>>, result) ->
        result + field_as_outcome(opponents_choice, outcome)
      end)
  end
end

IO.puts("Day2-A answer. The total score if the last input is the choise is: #{AdventOfCode2022_Day2.day2_a}")
IO.puts("Day2-B answer. The total score if the last input is the outcome is: #{AdventOfCode2022_Day2.day2_b}")
