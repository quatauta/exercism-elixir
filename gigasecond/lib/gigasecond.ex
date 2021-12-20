defmodule Gigasecond do
  @moduledoc false

  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from(File.erlang_time()) :: File.erlang_time()
  def from({{_, _, _}, {_, _, _}} = date) do
    date
    |> NaiveDateTime.from_erl!()
    |> NaiveDateTime.add(1_000_000_000)
    |> NaiveDateTime.to_erl()
  end
end
