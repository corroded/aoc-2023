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

      # 1 + 2 + 5 are the only valid games
      assert Cubes.calculate(games) == 8
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

      assert Cubes.parse_colors(game) == {:ok, %{"blue" => 23, "red" => 1, "green" => 2}}
    end
  end

  describe "get_least_common_cubes/1" do
    test "it gives least amount of cubes per game" do
      game = "3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
      assert Cubes.get_least_common_cubes(game) == %{"red" => 4, "green" => 2, "blue" => 6}

      game2 = "1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue"
      assert Cubes.get_least_common_cubes(game2) == %{"red" => 1, "green" => 3, "blue" => 4}

      game3 = "8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"
      assert Cubes.get_least_common_cubes(game3) == %{"red" => 20, "green" => 13, "blue" => 6}

      game4 = "1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red"
      assert Cubes.get_least_common_cubes(game4) == %{"red" => 14, "green" => 3, "blue" => 15}

      game5 = "6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"
      assert Cubes.get_least_common_cubes(game5) == %{"red" => 6, "green" => 3, "blue" => 2}
    end
  end

  describe "get_cube_power/1" do
    test "it multiplies the colors" do
      assert Cubes.get_cube_power(%{"red" => 4, "green" => 2, "blue" => 6}) == 48
      assert Cubes.get_cube_power(%{"red" => 1, "green" => 3, "blue" => 4}) == 12
      assert Cubes.get_cube_power(%{"red" => 20, "green" => 13, "blue" => 6}) == 1560
      assert Cubes.get_cube_power(%{"red" => 14, "green" => 3, "blue" => 15}) == 630
      assert Cubes.get_cube_power(%{"red" => 6, "green" => 3, "blue" => 2}) == 36
    end
  end

  describe "get_total_power/1" do
    test "it adds up all powers" do
      games = """
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
      """

      assert Cubes.get_total_power(games) == 2286
    end
  end
end
