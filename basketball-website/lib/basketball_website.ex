defmodule BasketballWebsite do
  @moduledoc false

  @spec extract_from_path(any, String.t()) :: any
  def extract_from_path(data, path) do
    extract_from_path_keys(data, String.split(path, "."))
  end

  defp extract_from_path_keys(data, []), do: data

  defp extract_from_path_keys(data, [key | rest]) do
    extract_from_path_keys(data[key], rest)
  end

  @spec get_in_path(any, String.t()) :: any
  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
