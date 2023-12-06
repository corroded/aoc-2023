defmodule TrebuchetTest do
  use ExUnit.Case

  test "calculates calibration values" do
    values = """
      1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet
    """
    assert Trebuchet.calibrate(values) == 142
  end

  test "takes into account number words" do
    values = """
      two1nine
      eightwothree
      abcone2threexyz
      xtwone3four
      4nineeightseven2
      zoneight234
      7pqrstsixteen
    """
    assert Trebuchet.calibrate(values) == 281
  end
end
