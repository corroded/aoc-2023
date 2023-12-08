defmodule GearsTest do
  use ExUnit.Case

  describe "get_symbol_coords/1" do
    test "it returns a list of coords for each symbol" do
      input = """
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
      """

      assert Gears.get_symbol_coords(input) == [{1, 3}, {3, 6}, {4, 3}, {5, 5}, {8, 3}, {8, 5}]
    end
  end
end
