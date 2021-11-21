defmodule DateParser do
  @moduledoc false

  @spec day :: String.t()
  def day() do
    "((0?[0-9])|([12][0-9])|(3[01]))"
  end

  @spec month() :: String.t()
  def month() do
    "((0?[0-9])|(1[0-2]))"
  end

  @spec year() :: String.t()
  def year() do
    "([0-9]{4})"
  end

  @spec day_names() :: String.t()
  def day_names() do
    "(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)"
  end

  @spec month_names() :: String.t()
  def month_names() do
    "(January|February|March|April|May|June|July|August|September|October|November|December)"
  end

  @spec capture_day() :: String.t()
  def capture_day() do
    "(?<day>#{day()})"
  end

  @spec capture_month() :: String.t()
  def capture_month() do
    "(?<month>#{month()})"
  end

  @spec capture_year() :: String.t()
  def capture_year() do
    "(?<year>#{year()})"
  end

  @spec capture_day_name() :: String.t()
  def capture_day_name() do
    "(?<day_name>#{day_names()})"
  end

  @spec capture_month_name() :: String.t()
  def capture_month_name() do
    "(?<month_name>#{month_names()})"
  end

  @spec capture_numeric_date() :: String.t()
  def capture_numeric_date() do
    "#{capture_day()}/#{capture_month()}/#{capture_year()}"
  end

  @spec capture_month_name_date() :: String.t()
  def capture_month_name_date() do
    "#{capture_month_name()} #{capture_day()}, #{capture_year()}"
  end

  @spec capture_day_month_name_date() :: String.t()
  def capture_day_month_name_date() do
    "#{capture_day_name()}, #{capture_month_name()} #{capture_day()}, #{capture_year()}"
  end

  @spec match_numeric_date :: Regex.t()
  def match_numeric_date() do
    Regex.compile!("^#{capture_numeric_date()}$")
  end

  @spec match_month_name_date :: Regex.t()
  def match_month_name_date() do
    Regex.compile!("^#{capture_month_name_date()}$")
  end

  @spec match_day_month_name_date :: Regex.t()
  def match_day_month_name_date() do
    Regex.compile!("^#{capture_day_month_name_date()}$")
  end
end
