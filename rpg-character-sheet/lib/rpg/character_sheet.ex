defmodule RPG.CharacterSheet do
  @moduledoc false

  @spec welcome() :: :ok
  def welcome do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  @spec ask_name() :: String.t()
  def ask_name do
    "What is your character's name?\n" |> IO.gets() |> String.trim()
  end

  @spec ask_class() :: String.t()
  def ask_class do
    "What is your character's class?\n" |> IO.gets() |> String.trim()
  end

  @spec ask_level() :: integer
  def ask_level do
    "What is your character's level?\n" |> IO.gets() |> String.trim() |> String.to_integer()
  end

  @spec run() :: %{class: String.t(), level: integer, name: String.t()}
  def run do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    character = %{name: name, class: class, level: level}

    # credo:disable-for-next-line Credo.Check.Warning.IoInspect
    IO.inspect(character, label: "Your character")
  end
end
