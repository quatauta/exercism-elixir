defmodule Secrets do
  @moduledoc false

  use Bitwise

  @spec secret_add(number) :: (number -> number)
  def secret_add(secret) do
    fn x -> trunc(x) + trunc(secret) end
  end

  @spec secret_subtract(number) :: (number -> number)
  def secret_subtract(secret) do
    fn x -> trunc(x) - trunc(secret) end
  end

  @spec secret_multiply(number) :: (number -> number)
  def secret_multiply(secret) do
    fn x -> trunc(x) * trunc(secret) end
  end

  @spec secret_divide(number) :: (number -> float)
  def secret_divide(secret) do
    fn x -> Integer.floor_div(trunc(x), trunc(secret)) end
  end

  @spec secret_and(number) :: (number -> integer)
  def secret_and(secret) do
    fn x -> band(trunc(x), trunc(secret)) end
  end

  @spec secret_xor(integer) :: (integer -> integer)
  def secret_xor(secret) do
    fn x -> bxor(trunc(x), trunc(secret)) end
  end

  @spec secret_combine((any -> any), (any -> any)) :: (any -> any)
  def secret_combine(secret_function1, secret_function2) do
    fn x -> x |> trunc |> secret_function1.() |> secret_function2.() end
  end
end
