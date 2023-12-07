defmodule Trebuchet do
  @word_to_num_mapping %{
    one: 1,
    two: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9
  }
  def calibrate(value) do
    number_words = Map.keys(@word_to_num_mapping) |> Enum.map(&(to_string(&1)))
    String.replace(value, number_words, fn mat -> words_to_num(mat) end)
    |> IO.inspect(label: "before split")
    |> String.split("\n", trim: true)
    |> IO.inspect(label: "after split")
    |> Enum.map(fn line ->
      rep = String.replace(line, ~r/[[:alpha:][:blank:]]+/, "")
      kek = "#{String.first(rep)}#{String.last(rep)}"
      IO.inspect("converting line: #{line} to #{kek}")
      kek
    end)
    |> Enum.map(fn num ->
      {x, ""} = Integer.parse(num)
      x
    end)
    |> Enum.sum
  end

  defp words_to_num(value) do
    {:ok, num} = Map.fetch(@word_to_num_mapping, value |> String.to_atom())
    Integer.to_string(num)
  end
end
