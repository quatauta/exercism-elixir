defmodule LogLevel do
  @moduledoc false

  @spec to_label(integer, boolean) :: :debug | :error | :fatal | :info | :trace | :unknown | :warning
  def to_label(0, false), do: :trace
  def to_label(0, true), do: :unknown
  def to_label(1, _), do: :debug
  def to_label(2, _), do: :info
  def to_label(3, _), do: :warning
  def to_label(4, _), do: :error
  def to_label(5, false), do: :fatal
  def to_label(5, true), do: :unknown
  def to_label(_, _), do: :unknown

  @spec alert_recipient(atom, boolean) :: :dev1 | :dev2 | nil | :ops
  def alert_recipient(level, true) when level < 1 or level > 4, do: :dev1
  def alert_recipient(level, false) when level < 0 or level > 5, do: :dev2
  def alert_recipient(level, _) when level == 4, do: :ops
  def alert_recipient(level, _) when level == 5, do: :ops
  def alert_recipient(_, _), do: nil
end
