defmodule Cubes do
 # def valid_game?(games) do
 #   String.split(games, ";")
 #   |> Enum.each(fn game ->
 #     with {:ok, red_green} <- parse_blue(game) do
 #       IO.inspect game
 #     end
 #   end)
 # end

  def parse_colors(game) do
    Regex.scan(~r/([\d]+) ([red|blue|green]+)/, game)
    |> Enum.reduce(%{}, fn x, acc ->
      [_, num, color] = x
      Map.put(acc, color, String.to_integer(num))
    end)
  end
end
