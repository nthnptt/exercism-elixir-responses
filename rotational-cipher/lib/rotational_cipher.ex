defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    charlist = String.to_charlist(text)
    |> Enum.map(fn(element) ->
      cond do
        element >= ?A && element <= ?Z -> char_shift(element, shift, ?A)
        element >= ?a && element <= ?z -> char_shift(element, shift, ?a)
        true -> element
      end
    end)
    "#{charlist}"
  end

  @spec char_shift(char :: char, shift :: integer, start:: integer) :: char
  defp char_shift(char, shift, start) do
    start + rem((char+shift)-start, 26)
  end
end
