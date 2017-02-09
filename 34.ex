defmodule Elxr do

  def fac(0), do: 1
  def fac(1), do: 1
  def fac(n) when n > 1, do: n * fac(n - 1)

  def countNums(a) do
    if div(a, 10) > 0, do: 1 + countNums(div(a, 10)), else: 1
  end

  def numToDigits(a), do: numToDigits(a, countNums(a))
  def numToDigits(a, 1), do: [a]
  def numToDigits(a, b), do: numToDigits(div(a, 10), b - 1, [rem(a, 10)])
  def numToDigits(a, 1, xs), do: [a|xs]
  def numToDigits(a, b, xs), do: numToDigits(div(a, 10), b - 1, [rem(a, 10)|xs])

  def checkFac(a), do: if Enum.sum(Enum.map(numToDigits(a), &(fac(&1)))) == a, do: true, else: false

  def main, do: Enum.filter(3..10000000, fn x -> checkFac(x) end)

end