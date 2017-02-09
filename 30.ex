defmodule Elxr do
  
  def countNums(a) do
    if div(a, 10) > 0, do: 1 + countNums(div(a, 10)), else: 1
  end

  def numToDigits(a), do: numToDigits(a, countNums(a))
  def numToDigits(a, 1), do: [a]
  def numToDigits(a, b), do: numToDigits(div(a, 10), b - 1, [rem(a, 10)])
  def numToDigits(a, 1, xs), do: [a|xs]
  def numToDigits(a, b, xs), do: numToDigits(div(a, 10), b - 1, [rem(a, 10)|xs])

  def equalFivePower(a), do: if (Enum.map(numToDigits(a), fn x -> :math.pow(x, 5) end)
  |> Enum.sum()) == a, do: true, else: false

  def main do
    Stream.filter(2..200000, fn x -> equalFivePower(x) end) |> Enum.sum()
  end

end