defmodule Chessboard do
  @moduledoc false

  @type rank_range :: %Range{first: 1, last: 8, step: 1}
  @type file_range :: %Range{first: ?A, last: ?H, step: 1}

  @spec rank_range :: rank_range()
  def rank_range, do: 1..8

  @spec file_range :: file_range
  def file_range, do: ?A..?H

  @spec ranks :: list()
  def ranks, do: Enum.to_list(rank_range())

  @spec files :: [char()]
  def files, do: Enum.map(file_range(), &<<&1>>)
end
