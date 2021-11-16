defmodule RationalNumbers do
  @moduledoc false
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}) do
    if additive_inverse?({a1, b1}, {a2, b2}) do
      {0, 1}
    else
      reduce({a1 * b2 + a2 * b1, b1 * b2})
    end
  end

  defp additive_inverse?({a1, b1}, {a2, b2}) do
    reduce({-1 * a1, b1}) == reduce({a2, b2})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}) do
    reduce({a1 * b2 - a2 * b1, b1 * b2})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    reduce({a1 * a2, b1 * b2})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) do
    {a3, b3} = RationalNumbers.abs({a1 * b2, a2 * b1})
    sign = sign(a1) * sign(a2)
    reduce({sign * a3, b3})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}) do
    {Kernel.abs(a), Kernel.abs(b)}
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a, b}, n) when n >= 0 do
    reduce({Integer.pow(a, n), Integer.pow(b, n)})
  end

  def pow_rational({a, b}, n) when n < 0 do
    m = Kernel.abs(n)
    reduce({Integer.pow(b, m), Integer.pow(a, m)})
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}) do
    Float.pow(Float.pow(1.0 * x, 1.0 * a), 1 / b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a, b}) do
    sign = min(sign(a), sign(b))
    {abs_a, abs_b} = RationalNumbers.abs({a, b})
    gcd = Integer.gcd(abs_a, abs_b)
    {sign * trunc(abs_a / gcd), trunc(abs_b / gcd)}
  end

  defp sign(number) do
    (0 <= number && 1) || -1
  end
end
