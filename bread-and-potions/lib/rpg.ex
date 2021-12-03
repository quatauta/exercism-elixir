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
    @spec eat(edible :: LoafOfBread | ManaPotion | Poison, character :: Character) :: {nil | EmptyBottle, Character}
    def eat(edible, character)
  end

  defimpl Edible, for: LoafOfBread do
    def eat(%LoafOfBread{}, %Character{} = character) do
      {nil, %{character | health: character.health + 5}}
    end
  end

  defimpl Edible, for: ManaPotion do
    def eat(%ManaPotion{strength: strength}, %Character{} = character) do
      {%EmptyBottle{}, %{character | mana: character.mana + strength}}
    end
  end

  defimpl Edible, for: [Poison, Character] do
    def eat(%Poison{}, %Character{} = character) do
      {%EmptyBottle{}, %{character | health: 0}}
    end
  end
end
