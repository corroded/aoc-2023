defmodule Gears do
  def get_symbol_coords(input) do
    String.split(input, "\n", trim: true)
    |> Enum.with_index(fn line, index ->
      String.trim(line)
      |> String.split("")
      |> Enum.with_index(fn char, y ->
        if String.match?(char, ~r/\-|\*|\/|=|#|&|\$|\+|%|@/) do
          {index, y - 1}
        end
      end)
      |> Enum.reject(&is_nil/1)
    end)
    |> Enum.reject(&Enum.empty?/1)
    |> List.flatten()
  end
end
