defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.reduce(dna, '', fn(char, acc) ->
      case char do
        ?G -> 'C'
        ?C -> 'G'
        ?T -> 'A'
        ?A -> 'U'
        _ -> char
      end
    end)
  end
end
