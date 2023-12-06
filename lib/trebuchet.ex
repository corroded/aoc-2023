defmodule Trebuchet do
  def calibrate(value) do
    String.split(value, "\n", trim: true)
      |> Enum.map(fn line ->
        rep = String.replace(line, ~r/[[:alpha:][:blank:]]+/, "")
        "#{String.first(rep)}#{String.last(rep)}"
      end)
      |> IO.inspect
      |> Enum.map(fn num ->
        {x, ""} = Integer.parse(num)
        x
      end)
      |> Enum.sum
  end
end
