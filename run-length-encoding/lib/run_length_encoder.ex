defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    Regex.replace(~r/(.)\1*/, string, fn(matched_string, char) ->
      case String.length(matched_string) do
        1 -> char
        length -> Integer.to_string(length) <> char
      end
    end)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    Regex.replace(~r/(\d{1,})(.)/, string, fn(matched_string, number, char) ->
      String.duplicate(char, String.to_integer(number))
    end)
  end
end
