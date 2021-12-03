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
    def eat(edible, character)
  end

  defimpl Edible, for: LoafOfBread do
    def eat(%LoafOfBread{}, character) do
      {nil, %{character | health: character.health + 5}}
    end
  end

  defimpl Edible, for: ManaPotion do
    def eat(%ManaPotion{strength: strength}, character) do
      {%EmptyBottle{}, %{character | mana: character.mana + strength}}
    end
  end
end
