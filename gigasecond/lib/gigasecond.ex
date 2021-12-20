defmodule Gigasecond do
  @moduledoc false

  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from(
          {{year :: pos_integer, month :: pos_integer, day :: pos_integer},
           {hour :: pos_integer, minute :: pos_integer, second :: pos_integer}}
        ) ::
          {{year :: pos_integer, month :: pos_integer, day :: pos_integer},
           {hour :: pos_integer, minute :: pos_integer, second :: pos_integer}}
  def from({{_, _, _} = date, {_, _, _} = time}) do
    datetime = DateTime.new!(Date.from_erl!(date), Time.from_erl!(time))
    future = DateTime.add(datetime, 1_000_000_000)
    {Date.to_erl(future), Time.to_erl(future)}
  end
end
