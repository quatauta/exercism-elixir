defmodule LogLevel do
  @moduledoc false

  @spec to_label(integer, boolean) :: :trace | :debug | :info | :warning | :error | :fatal
  def to_label(level, legacy?) do
    cond do
      level == 0 && !legacy? -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 && !legacy? -> :fatal
      true -> :unknown
    end
  end

  @spec alert_recipient(integer, boolean) :: :dev1 | :dev2 | :ops | nil
  def alert_recipient(level, legacy?) do
    cond do
      legacy? && (level < 1 || 4 < level) -> :dev1
      !legacy? && (level < 0 || 5 < level) -> :dev2
      level in [4, 5] -> :ops
      true -> nil
    end
  end
end
