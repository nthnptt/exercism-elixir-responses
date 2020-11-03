defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
      String.split(sentence, :binary.compile_pattern([" ", "_"]))
      |>Enum.map(fn (x) -> String.downcase(x) end)
      |>Enum.map(fn (x) -> String.replace(x, :binary.compile_pattern(["!", "&" ,"@","$","%","^","&",".",",",":"]), "") end)
      |>Enum.reduce(%{}, fn (word, acc) -> Map.update(acc, word, 1, fn (value) -> value+1 end) end)
      |>Map.delete("")
  end
end
