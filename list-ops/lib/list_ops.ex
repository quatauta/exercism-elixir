defmodule ListOps do
  @moduledoc """
  Please don't use any external modules (especially List) in your
  implementation. The point of this exercise is to create these basic functions
  yourself.

  Note that `++` is a function from an external module (Kernel, which is
  automatically imported) and so shouldn't be used either.
  """

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([_head | tail]), do: 1 + count(tail)

  @spec reverse(list) :: list
  def reverse(l), do: do_reverse({l, []})

  defp do_reverse({[], rev_list}), do: rev_list

  defp do_reverse({[h | t], rl}), do: do_reverse({t, [h | rl]})

  @spec map(list, (any -> any)) :: list
  def map([], _f), do: []

  def map([h | t], f), do: [f.(h) | map(t, f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _f), do: []

  def filter([h | t], f), do: if(f.(h), do: [h | filter(t, f)], else: filter(t, f))

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl([], acc, _f), do: acc

  def foldl([h | t], acc, f), do: foldl(t, f.(h, acc), f)

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr(l, acc, f), do: foldl(reverse(l), acc, f)

  @spec append(list, list) :: list
  def append(_a = [], b), do: b

  def append(_a = [h | t], b), do: [h | append(t, b)]

  @spec concat([[any]]) :: [any]
  def concat(ll), do: foldr(ll, [], &append/2)
end
