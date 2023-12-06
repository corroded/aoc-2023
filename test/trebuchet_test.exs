defmodule TrebuchetTest do
  use ExUnit.Case
  doctest AOC

  test "calculates calibration values" do
    values = """
      1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet
    """
    assert Trebuchet.calibrate(values) == 142
  end
end
