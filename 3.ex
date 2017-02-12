defmodule Elxr do
  
  def cutPrime(a, b) do
    if rem(a, b) == 0, do: cutPrime(div(a, b), b), else: a
  end

  def mainFunc(a, 1), do: a - 1
  def mainFunc(a, c) do
    cond do
      rem(c, a) == 0 -> mainFunc(a + 1, cutPrime(c, a))
      :math.pow(a, 2) >= c -> c
      true -> mainFunc(a + 1, c)
    end
  end

  def main do
    mainFunc(2, 600851475143)
  end

end