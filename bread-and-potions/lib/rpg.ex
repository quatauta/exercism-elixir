defmodule RPG do
  @moduledoc false

  defmodule Character do
    @moduledoc false

    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    @moduledoc false

    defstruct []
  end

  defmodule ManaPotion do
    @moduledoc false

    defstruct strength: 10
  end

  defmodule Poison do
    @moduledoc false

    defstruct []
  end

  defmodule EmptyBottle do
    @moduledoc false

    defstruct []
  end

  defprotocol Edible do
    @spec eat(t, any) :: any
    def eat(item, character)
  end

  defimpl Edible, for: LoafOfBread do
    def eat(_, character) do
      {nil, %{character | health: character.health + 5}}
    end
  end

  defimpl Edible, for: ManaPotion do
    def eat(item, character) do
      {%EmptyBottle{}, %{character | mana: character.mana + item.strength}}
    end
  end

  defimpl Edible, for: Poison do
    def eat(_, character) do
      {%EmptyBottle{}, %{character | health: 0}}
    end
  end
end
