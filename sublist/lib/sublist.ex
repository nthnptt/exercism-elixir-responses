defmodule Sublist do
  @type compare_result :: :equal
            | :sublist
            | :superlist
            | :unequal

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @spec compare(a:: List.t(),b :: List.t()) :: compare_result
  def compare(a, b) do
    cond do
      a === b -> :equal
      substring?(a, b) -> :superlist
      substring?(b, a) -> :sublist
      true -> :unequal
    end
  end


  @spec substring(list:: List.t(),testing_sublist :: List.t()) :: boolean
  defp substring?(list, testing_sublist) when length(list) < length(testing_sublist), do: false
  defp substring?(list, testing_sublist) do
    if Enum.take(list ,length(testing_sublist)) === testing_sublist, do: true, else: substring?(tl(list), testing_sublist)
  end
end
