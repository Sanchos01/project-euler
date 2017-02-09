defmodule Elxr do

  def countNums(a) do
    if div(a, 10) > 0, do: 1 + countNums(div(a, 10)), else: 1
  end

  def numToDigits(a), do: numToDigits(a, countNums(a))
  def numToDigits(a, 1), do: [a]
  def numToDigits(a, b), do: numToDigits(div(a, 10), b - 1, [rem(a, 10)])
  def numToDigits(a, 1, xs), do: [a|xs]
  def numToDigits(a, b, xs), do: numToDigits(div(a, 10), b - 1, [rem(a, 10)|xs])

  def isNumPalindrom(a), do: isListPalindrom(numToDigits(a))

  def isListPalindrom(a), do: a == Enum.reverse(a)

  def from10to2(a), do: from10to2(a, [])
  def from10to2(0, xs), do: xs
  def from10to2(1, xs), do: [1|xs]
  def from10to2(a, xs), do: from10to2(div(a,2), [rem(a,2)|xs])

  def main do
    Stream.filter(1..1000000, fn x -> isNumPalindrom(x) end)
    |> Enum.filter(fn x -> isListPalindrom(from10to2(x)) end)
    |> Enum.sum()
  end

end