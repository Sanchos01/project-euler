defmodule Elxr do

  def main do
    Enum.map(1..1000, fn x -> firstTenNums(x) end) |> Enum.sum |> rem(10000000000)
  end

  def firstTenNums(1), do: 1
  def firstTenNums(a), do: firstTenNums(a, a, 1)
  def firstTenNums(_, _, 0), do: 0
  def firstTenNums(a, 1, n), do: rem(n * a, 10000000000)
  def firstTenNums(a, b, n) when a > 1 do
    firstTenNums(a, b - 1, rem(n * a, 10000000000))
  end

end