defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    build_verse(number)
  end

  defp build_verse(1) do
    """
    1 bottle of beer on the wall, 1 bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    """
  end

  defp build_verse(0) do
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end

  defp build_verse(number) do
    """
    #{number} bottles of beer on the wall, #{number} bottles of beer.
    Take one down and pass it around, #{number-1} #{pluralize("bottle", number-1)} of beer on the wall.
    """
  end

  defp pluralize(word, number) do
    if number>1, do: word<>"s", else: word
  end

  defp concat_verse(actual..min = range, result) do
    if min == actual do
      result <> verse(actual)
    else
      result <> verse(actual) <> "\n" <> concat_verse((actual-1)..min, result)
    end
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    concat_verse(range, "")
  end
end
