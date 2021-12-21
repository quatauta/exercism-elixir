defmodule RemoteControlCar do
  @moduledoc false

  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  @type t :: %RemoteControlCar{}

  @spec new :: t()
  def new, do: new("none")

  @spec new(nickname :: String.t()) :: RemoteControlCar.t()
  def new(nickname), do: %RemoteControlCar{nickname: nickname}

  @spec display_distance(remote_car :: RemoteControlCar.t()) :: String.t()
  def display_distance(%RemoteControlCar{} = remote_car) do
    "#{remote_car.distance_driven_in_meters} meters"
  end

  @spec display_battery(remote_car :: RemoteControlCar.t()) :: String.t()
  def display_battery(%RemoteControlCar{battery_percentage: 0}), do: "Battery empty"

  def display_battery(%RemoteControlCar{} = remote_car) do
    "Battery at #{remote_car.battery_percentage}%"
  end

  @spec drive(remote_car :: RemoteControlCar.t()) :: RemoteControlCar.t()
  def drive(%RemoteControlCar{battery_percentage: 0} = remote_car), do: remote_car

  def drive(%RemoteControlCar{} = remote_car) do
    %{
      remote_car
      | battery_percentage: remote_car.battery_percentage - 1,
        distance_driven_in_meters: remote_car.distance_driven_in_meters + 20
    }
  end
end
