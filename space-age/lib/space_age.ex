defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    do_age_on(planet, seconds)
  end

  @spec do_age_on(planet, pos_integer) :: float
  defp do_age_on(:earth, seconds), do: seconds/31557600
  defp do_age_on(:mercury, seconds), do: do_age_on(:earth, seconds)/0.2408467
  defp do_age_on(:venus, seconds), do: do_age_on(:earth, seconds)/0.61519726
  defp do_age_on(:mars, seconds), do: do_age_on(:earth, seconds)/1.8808158
  defp do_age_on(:jupiter, seconds), do: do_age_on(:earth, seconds)/11.862615
  defp do_age_on(:saturn, seconds), do: do_age_on(:earth, seconds)/29.447498
  defp do_age_on(:uranus, seconds), do: do_age_on(:earth, seconds)/84.016846
  defp do_age_on(:neptune, seconds), do: do_age_on(:earth, seconds)/164.79132
end
