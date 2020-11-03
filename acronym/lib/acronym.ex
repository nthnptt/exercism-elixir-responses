defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/[- _,]/, trim: true)
    |> Enum.reduce("", fn (<<head :: binary-size(1)>> <> other, acc) ->
      result = acc <>String.capitalize(head)
      # testing if other is capitalize, return first letter, else return all capitalized letter
      if String.match?(other, ~r/^[A-Z]*$/), do: result, else: result <> String.replace(other, ~r/[a-z',-]/, "")
    end)
  end
end
