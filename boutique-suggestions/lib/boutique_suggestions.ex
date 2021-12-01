defmodule BoutiqueSuggestions do
  @moduledoc false

  @type item :: %{
          item_name: String.t(),
          base_color: String.t(),
          price: pos_integer()
        }

  @type items :: [item()]

  @spec get_combinations(tops :: items(), bottoms :: items(), options :: list()) :: list
  def get_combinations(tops, bottoms, options \\ []) do
    maximum_price = Keyword.get(options, :maximum_price, 100)

    for top <- tops,
        bottom <- bottoms,
        top.base_color != bottom.base_color,
        top.price + bottom.price < maximum_price do
      {top, bottom}
    end
  end
end
