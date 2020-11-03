defmodule RomanNumerals do
  @translate_table %{
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M",
  }

  @roman_stack Map.keys(@translate_table) |> Enum.sort(&(&1 > &2))

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    n_to_r(@roman_stack, number, "")
  end

  #@doc """
 #   Convert number to roman
#  """
#  @spec n_to_r(pos_integer, pos_integer, pos_integer, String.t() :: String.t()

  defp n_to_r(_, 0, result) do result end

  defp n_to_r([stack | next] = stacks, number, result) do
    if number >= stack do
      n_to_r(stacks, number-stack, result <> Map.get(@translate_table, stack))
    else
      n_to_r(next, number, result)
    end
  end
end
