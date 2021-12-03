defmodule RPG do
  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []
  end

  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

defprotocol Edible do
  def eat(edible, character)
end

defimpl Edible, for: LoafOfBread do
  def eat(edible, character) do
    {nil, %{character | health: (character.health + 5)}}
  end
end
end
