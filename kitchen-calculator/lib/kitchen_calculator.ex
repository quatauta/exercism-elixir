defmodule KitchenCalculator do
  @moduledoc false

  @spec get_volume({any, any}) :: any
  def get_volume({_, volume}), do: volume

  @spec to_milliliter(
          {:cup, number}
          | {:fluid_ounce, number}
          | {:milliliter, number}
          | {:tablespoon, number}
          | {:teaspoon, number}
        ) :: {:milliliter, number}
  def to_milliliter({:cup, cups}), do: {:milliliter, cups * 240}
  def to_milliliter({:fluid_ounce, fluid_ounces}), do: {:milliliter, fluid_ounces * 30}
  def to_milliliter({:teaspoon, teaspoons}), do: {:milliliter, teaspoons * 5}
  def to_milliliter({:tablespoon, tablespoons}), do: {:milliliter, tablespoons * 15}
  def to_milliliter({:milliliter, milliliters}), do: {:milliliter, milliliters}

  @spec from_milliliter(
          {:milliliter, number},
          :cup | :fluid_ounce | :milliliter | :tablespoon | :teaspoon
        ) ::
          {:cup, float}
          | {:fluid_ounce, float}
          | {:milliliter, number}
          | {:tablespoon, float}
          | {:teaspoon, float}
  def from_milliliter({:milliliter, milliliter}, :cup), do: {:cup, milliliter / 240}

  def from_milliliter({:milliliter, milliliter}, :fluid_ounce),
    do: {:fluid_ounce, milliliter / 30}

  def from_milliliter({:milliliter, milliliter}, :teaspoon), do: {:teaspoon, milliliter / 5}
  def from_milliliter({:milliliter, milliliter}, :tablespoon), do: {:tablespoon, milliliter / 15}
  def from_milliliter({:milliliter, milliliter}, :milliliter), do: {:milliliter, milliliter}

  @spec convert(
          {:cup, number}
          | {:fluid_ounce, number}
          | {:milliliter, number}
          | {:tablespoon, number}
          | {:teaspoon, number},
          :cup | :fluid_ounce | :milliliter | :tablespoon | :teaspoon
        ) ::
          {:cup, float}
          | {:fluid_ounce, float}
          | {:milliliter, number}
          | {:tablespoon, float}
          | {:teaspoon, float}
  def convert(volume_pair, unit) do
    volume_pair |> to_milliliter() |> from_milliliter(unit)
  end
end
