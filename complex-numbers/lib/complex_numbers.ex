defmodule ComplexNumbers do
  @moduledoc false

  @typedoc """
  In this module, complex numbers are represented as a tuple-pair containing the real and
  imaginary parts.
  For example, the real number `1` is `{1, 0}`, the imaginary number `i` is `{0, 1}` and
  the complex number `4+3i` is `{4, 3}'.
  """
  @type complex :: {float, float}

  @doc """
  Return the real part of a complex number
  """
  @spec real(a :: complex) :: float
  def real({r, _}), do: r

  @doc """
  Return the imaginary part of a complex number
  """
  @spec imaginary(a :: complex) :: float
  def imaginary({_, i}), do: i

  @doc """
  Multiply two complex numbers, or a real and a complex number
  """
  @spec mul(a :: complex | float, b :: complex | float) :: complex
  def mul({r1, i1}, {r2, i2}), do: {r1 * r2 - i1 * i2, i1 * r2 + r1 * i2}
  def mul(a, {r2, i2}), do: {r2 * a, i2 * a}
  def mul({r1, i1}, b), do: {r1 * b, i1 * b}

  @doc """
  Add two complex numbers, or a real and a complex number
  """
  @spec add(a :: complex | float, b :: complex | float) :: complex
  def add({r1, i1}, {r2, i2}), do: {r1 + r2, i1 + i2}
  def add(a, {r2, i2}), do: add({a, 0.0}, {r2, i2})
  def add({r1, i1}, b), do: add({r1, i1}, {b, 0.0})

  @doc """
  Subtract two complex numbers, or a real and a complex number
  """
  @spec sub(a :: complex | float, b :: complex | float) :: complex
  def sub({r1, i1}, {r2, i2}), do: {r1 - r2, i1 - i2}
  def sub(a, {r2, i2}), do: sub({a, 0.0}, {r2, i2})
  def sub({r1, i1}, b), do: sub({r1, i1}, {b, 0.0})

  @doc """
  Divide two complex numbers, or a real and a complex number
  """
  @spec div(a :: complex | float, b :: complex | float) :: complex
  # `(a + i * b) / (c + i * d) = (a * c + b * d)/(c^2 + d^2) + (b * c - a * d)/(c^2 + d^2) * i`.
  def div({r1, i1}, {r2, i2}) do
    {(r1 * r2 + i1 * i2) / (r2 ** 2 + i2 ** 2), (i1 * r2 - r1 * i2) / (r2 ** 2 + i2 ** 2)}
  end

  def div(a, {r2, i2}), do: __MODULE__.div({a, 0.0}, {r2, i2})
  def div({r1, i1}, b), do: __MODULE__.div({r1, i1}, {b, 0.0})

  @doc """
  Absolute value of a complex number
  """
  @spec abs(a :: complex) :: float
  def abs(a) do
  end

  @doc """
  Conjugate of a complex number
  """
  @spec conjugate(a :: complex) :: complex
  def conjugate(a) do
  end

  @doc """
  Exponential of a complex number
  """
  @spec exp(a :: complex) :: complex
  def exp(a) do
  end
end
