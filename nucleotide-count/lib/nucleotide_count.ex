defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    Enum.reduce(strand,0,&(if &1 == nucleotide, do: &2+1, else: &2))
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    default_acc = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
    Enum.reduce(strand, default_acc, fn(char, acc) ->
      Map.update!(acc, char, &(&1+1))
    end)
  end
end
