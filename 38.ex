defmodule Elxr do

  def countNums(a) do
    if div(a, 10) > 0, do: 1 + countNums(div(a, 10)), else: 1
  end

  def numToDigits(a), do: numToDigits(div(a, 10), countNums(a) - 1, [rem(a, 10)])
  defp numToDigits(_a, 0, xs), do: xs
  defp numToDigits(a, 1, xs), do: [a|xs]
  defp numToDigits(a, b, xs), do: numToDigits(div(a, 10), b - 1, [rem(a, 10)|xs])

  def digitsToNum([]), do: IO.puts("fn digits-to-nums take empty list")
  def digitsToNum(xs), do: digitsToNum(xs, length(xs))
  defp digitsToNum(xs, 1), do: hd(xs)
  defp digitsToNum([x|xs], n), do: round(x * :math.pow(10, n-1)) + digitsToNum(xs, n-1)

  def multis(a, 1), do: numToDigits(a)
  def multis(a, n) when a > 1, do: multis(a, n - 1) ++ numToDigits(a * n)
  
  def collectPanMultis(a \\ 2, n \\ 1, tuple \\ {0, 0})
  def collectPanMultis(10000, _n, tuple), do: tuple
  def collectPanMultis(a, n, {num, multi}) do
    numCheck = multis(a, n)
    cond do
      length(numCheck) < 9 -> collectPanMultis(a, n + 1, {num, multi})
      length(numCheck) > 9 -> collectPanMultis(a + 1, 1, {num, multi})
      numCheck -- [1,2,3,4,5,6,7,8,9] == [] -> if digitsToNum(numCheck) > multi,
        do: collectPanMultis(a + 1, 1, {a, digitsToNum(numCheck)}),
        else: collectPanMultis(a + 1, 1, {num, multi})
      true -> collectPanMultis(a + 1, 1, {num, multi})
    end
  end

  def main do
    collectPanMultis()
  end

end