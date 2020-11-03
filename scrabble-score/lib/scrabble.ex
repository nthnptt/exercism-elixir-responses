defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.trim()
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.reduce(0, fn (char, score) ->
      score + char_to_score(char)
    end)
  end


  @spec char_to_score(char) :: non_neg_integer
  defp char_to_score(char) do
    cond do
      char in [?d, ?g] -> 2
      char in [?b, ?c, ?m, ?p] -> 3
      char in [?f, ?h, ?v, ?w, ?y] -> 4
      char in [?k] -> 5
      char in [?j, ?x] -> 8
      char in [?q, ?z] -> 10
      true  -> 1
    end
  end

end
