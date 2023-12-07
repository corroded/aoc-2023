defmodule Cubes do
  @red_max 12
  @green_max 13
  @blue_max 14

  def calculate(games) do
    String.split(games, "\n", trim: true)
    |> Enum.map(fn game ->
      [game_name, game_string] = String.split(game, ":")

      if valid_game?(game_string) do
        [_, index] = String.trim(game_name) |> String.split(" ")
        String.to_integer(index)
      end
    end)
    |> Enum.reject(&is_nil/1)
    |> Enum.sum()
  end

  def get_total_power(games) do
    String.split(games, "\n", trim: true)
    |> Enum.map(fn game -> get_least_common_cubes(game) end)
    |> Enum.map(fn lcc -> get_cube_power(lcc) end)
    |> Enum.sum
  end

  def get_least_common_cubes(games) do
    game = String.split(games, ";")
      |> Enum.map(fn game ->
        {:ok, colors} = parse_colors(game)
        colors
      end)

    %{
      "blue" => Enum.map(game, fn x -> x["blue"] end) |> Enum.reject(&is_nil/1) |> Enum.max,
      "red" => Enum.map(game, fn x -> x["red"] end) |> Enum.reject(&is_nil/1) |> Enum.max,
      "green" => Enum.map(game, fn x -> x["green"] end) |> Enum.reject(&is_nil/1) |> Enum.max
    }
  end

  def get_cube_power(least_common_cubes) do
    Map.values(least_common_cubes) |> Enum.product
  end

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
    colors =
      Regex.scan(~r/([\d]+) ([red|blue|green]+)/, game)
      |> Enum.reduce(%{}, fn x, acc ->
        [_, num, color] = x
        Map.put(acc, color, String.to_integer(num))
      end)

    {:ok, colors}
  end
end
