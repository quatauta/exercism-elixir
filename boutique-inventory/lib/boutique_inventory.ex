defmodule BoutiqueInventory do
  @moduledoc false

  @type quantity_by_size :: %{atom() => number()}
  @type article :: %{
          name: String.t(),
          price: number(),
          quantity_by_size: quantity_by_size()
        }
  @type inventory :: [article(), ...]

  @spec sort_by_price(inventory :: inventory()) :: inventory()
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1.price)
  end

  @spec with_missing_price(inventory :: inventory()) :: inventory()
  def with_missing_price(inventory) do
    Enum.filter(inventory, &(&1.price == nil))
  end

  @spec increase_quantity(item :: article(), count :: number()) :: article()
  def increase_quantity(item, count) do
    Map.update!(item, :quantity_by_size, fn quantity ->
      quantity
      |> Enum.map(fn {size, quantity} -> {size, quantity + count} end)
      |> Enum.into(%{})
    end)
  end

  @spec total_quantity(article()) :: number()
  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_, count}, sum -> sum + count end)
  end
end
