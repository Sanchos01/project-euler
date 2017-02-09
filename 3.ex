defmodule Elxr do
  
  def cutPrime(a, b) do
    if rem(a, b) == 0, do: cutPrime(div(a, b), b), else: a
  end

  def mainFunc(a, b, c) do
    cond do
      rem(c, a) == 0 ->
        mainFunc(a + 1, div(c, a), cutPrime(c, a))
      a >= :math.sqrt(c) ->
        Enum.reduce([a - 1, b, c], 0, fn x, acc -> if x > acc, do: x, else: acc end)
      true ->
        mainFunc(a + 1, b, c)
    end
  end

  def testik do
    mainFunc(2, 1, 600851475143)
  end

end