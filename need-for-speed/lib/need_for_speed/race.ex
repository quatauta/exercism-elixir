defmodule NeedForSpeed.Race do
  @moduledoc false

  defstruct [
    :title,
    :total_distance_in_meters,
    cars: []
  ]

  @type t() :: %__MODULE__{
    title: String.t(),
    total_distance_in_meters: pos_integer(),
    cars: []
  }

  @spec display_status(__MODULE__.t()) :: String.t()
  def display_status(%NeedForSpeed.Race{} = race) do
    cond do
      Enum.any?(race.cars, &(&1.distance_driven_in_meters >= race.total_distance_in_meters)) ->
        "Finished"

      Enum.any?(race.cars, &(&1.distance_driven_in_meters > 0)) ->
        "In Progress"

      true ->
        "Not Started"
    end
  end

  @spec display_distance(__MODULE__.t()) :: String.t()
  def display_distance(%NeedForSpeed.Race{total_distance_in_meters: d}) do
    "#{d} meters"
  end
end
