defmodule Bob do
  def hey(input) do
    cond do
      has_silence?(input)-> "Fine. Be that way!"
      has_uppercase?(input) && finish_by_question_mark?(input) && has_char?(input) -> "Calm down, I know what I'm doing!"
      finish_by_question_mark?(input) -> "Sure."
      (has_uppercase?(input) && has_char?(input) && !has_only_numeric?(input)) || is_strange?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp has_mutliline?(input) do
    String.split(input, "\n")
  end

  defp finish_by_question_mark?(input) do
    String.trim(input)|>String.ends_with?("?")
  end

  defp has_silence?(input) do
    String.trim(input) === ""
  end

  defp has_only_numeric?(input) do
    String.replace(input, ~r/([0-9]|,|\?)/, "")
    |> String.trim() == ""
  end

  defp has_char?(input) do
    Regex.match?(~r/[a-zA-Z]/, input)
  end

  defp has_uppercase?(input)do
    String.upcase(input) === input
  end

  defp is_strange?(input) do
    !has_silence?(input) && !has_char?(input) && !has_only_numeric?(input)
  end
end
