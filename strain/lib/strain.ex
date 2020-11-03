defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    filtered(list, fun)
  end

  @spec filtered(list :: list(any), fun :: (any -> boolean)) :: list(any)
  defp filtered([head | items], control_function) do
    if control_function.(head),  do: [head] ++ filtered(items, control_function), else: filtered(items, control_function)
  end

  defp filtered([], _), do: []

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    filtered(list, &(!fun.(&1)))
  end
end
