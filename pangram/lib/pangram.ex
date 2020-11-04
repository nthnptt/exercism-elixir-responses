defmodule Pangram do
  @doc """
  Alphabet range collection, allow to manage different lang with configuration
  """
  @alphabet_range %{
    :eng => ?a..?z
  }

  @doc """
  Default alphabet if any other are selected
  """
  @alphabet_fallback :eng

  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """
  @spec pangram?(String.t(), atom) :: boolean
  def pangram?(sentence, lang  \\ @alphabet_fallback) do
    sentence
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.reduce(%{}, fn(item, acc) ->
      if Enum.member?(Map.get(@alphabet_range, lang), item) do
        Map.update(acc, item, 1, &(&1 + 1))
      else
        acc
      end
    end)
    |> Map.keys()
    |> length() === Enum.count(Map.get(@alphabet_range, lang))
  end
end
