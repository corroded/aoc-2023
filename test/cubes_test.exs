defmodule CubesTest do
  use ExUnit.Case

  describe "calculate/1 calculates total games" do
    test "it gives the sum of the valid game numbers" do
      games = """
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
      """

      assert Cubes.calculate(games) == 8 # 1 + 2 + 5 are the only valid games
    end
  end

  describe "valid_game?/1" do
    test "returns true for a valid game" do
      game = "3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"

      assert Cubes.valid_game?(game) == true
    end

    test "returns false for an invalid game" do
      game = "8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"

      assert Cubes.valid_game?(game) == false
    end
  end

   describe "parse_colors/1" do
     test "it makes a map with the colors and values" do
       game = "23 blue, 2 green, 1 red"

       assert Cubes.parse_colors(game) == %{"blue" => 23, "red" => 1, "green" => 2}
     end
   end
end
