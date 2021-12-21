defmodule HighScore do
  @moduledoc false

  @initial_score 0

  @spec new() :: %{}
  def new do
    %{}
  end

  @spec add_player(map, any, any) :: map
  def add_player(scores, name, score \\ @initial_score) do
    Map.put(scores, name, score)
  end

  @spec remove_player(map, any) :: map
  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  @spec reset_score(map, any) :: map
  def reset_score(scores, name) do
    Map.put(scores, name, @initial_score)
  end

  @spec update_score(map, any, any) :: map
  def update_score(scores, name, score) do
    Map.update(scores, name, score, &(&1 + score))
  end

  @spec get_players(map) :: list
  def get_players(scores) do
    Map.keys(scores)
  end
end
