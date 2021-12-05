defmodule NeedForSpeed.RemoteControlCar do
  @moduledoc false

  defstruct [
    :nickname,
    :color,
    battery_percentage: 100,
    distance_driven_in_meters: 0
  ]

  @type t() :: %__MODULE__{
    nickname: String.t(),
    color: :blue | :green | :red,
    battery_percentage: non_neg_integer(),
    distance_driven_in_meters: non_neg_integer()
  }

  @spec new(:blue | :green | :red, any) :: __MODULE__.t()
  def new(color, nickname) when color in [:red, :blue, :green] do
    %NeedForSpeed.RemoteControlCar{nickname: nickname, color: color}
  end

  @spec display_distance(__MODULE__.t()) :: String.t()
  def display_distance(%NeedForSpeed.RemoteControlCar{distance_driven_in_meters: d}) do
    "#{d} meters"
  end

  @spec display_battery(__MODULE__.t()) :: String.t()
  def display_battery(%NeedForSpeed.RemoteControlCar{battery_percentage: 0}) do
    "Battery empty"
  end

  def display_battery(%NeedForSpeed.RemoteControlCar{battery_percentage: b}) do
    "Battery at #{b}%"
  end
end
