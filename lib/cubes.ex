defmodule Cubes do
  @red_max 12
  @green_max 13
  @blue_max 14

  def valid_game?(games) do
    String.split(games, ";")
    |> Enum.all?(fn game ->
      with {:ok, colors} <- parse_colors(game) do
        (colors["red"] == nil or colors["red"] <= @red_max) and
        (colors["green"] == nil or colors["green"] <= @green_max) and
        (colors["blue"] == nil or colors["blue"] <= @blue_max)
      end
    end)
  end

  def parse_colors(game) do
    colors = Regex.scan(~r/([\d]+) ([red|blue|green]+)/, game)
    |> Enum.reduce(%{}, fn x, acc ->
      [_, num, color] = x
      Map.put(acc, color, String.to_integer(num))
    end)

    {:ok, colors}
  end
end
