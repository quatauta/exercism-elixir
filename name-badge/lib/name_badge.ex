defmodule NameBadge do
  @moduledoc false

  @spec print(nil | String.t(), String.t(), nil | String.t()) :: String.t()
  def print(id, name, department) do
    department = if department, do: String.upcase(department), else: "OWNER"
    id = if id, do: "[#{id}] - ", else: ""
    "#{id}#{name} - #{department}"
  end
end
