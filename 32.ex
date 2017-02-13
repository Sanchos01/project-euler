defmodule Elxr do
import Enum, only: [reduce_while: 3, map: 2, uniq: 1]

  def findDivisors(a) do
    Enum.reduce(2..round(:math.sqrt(a)), [], fn x, acc -> if rem(a,x)==0,
      do: (if :math.pow(x,2)==a, do: [[x,x]|acc], else: [[x,round(a/x)]|acc]), else: acc end)
  end

  def checkPandigital(a) do
    reduce_while(findDivisors(a), false, fn x, acc -> cond do
      Enum.sort(numToDigits(a) ++ (map(x, fn y -> numToDigits(y) end) |> Enum.concat)) ==
        [1,2,3,4,5,6,7,8,9] -> {:halt, true}
      true -> {:cont, acc}
    end end)
  end

  def countNums(a) do
    if div(a, 10) > 0, do: 1 + countNums(div(a, 10)), else: 1
  end

  def numToDigits(a), do: numToDigits(div(a, 10), countNums(a) - 1, [rem(a, 10)])
  defp numToDigits(_, 0, xs), do: xs
  defp numToDigits(a, 1, xs), do: [a|xs]
  defp numToDigits(a, b, xs), do: numToDigits(div(a, 10), b - 1, [rem(a, 10)|xs])

  def digitsToNum([]), do: IO.puts("fn digits-to-nums take empty list")
  def digitsToNum(xs), do: digitsToNum(xs, length(xs))
  defp digitsToNum(xs, 1), do: hd(xs)
  defp digitsToNum([x|xs], n), do: round(x * :math.pow(10, n-1)) + digitsToNum(xs, n-1)

  def variations([], _), do: []
  def variations(_, 0), do: []
  def variations(xs, n) do
    cond do
      xs != uniq(xs) -> IO.puts("Elements not unique")
      n > length(xs) -> IO.puts("n bigger than amount of elements of list")
      true -> variations(xs, [], n)
    end
  end
  defp variations([], ys, _), do: [ys]
  defp variations(xs, ys, n) do
    reduce_while(xs, [], fn x, acc -> if length(ys) == n, do: {:halt, acc ++ [ys]},
      else: {:cont, acc ++ variations((xs -- [x]), (ys ++ [x]), n)} end)
  end

  def main do
    Elxr.variations([1,2,3,4,5,6,7,8,9], 4)
    |> Enum.map(fn x -> Elxr.digitsToNum(x) end)
    |> Enum.filter(fn x -> Elxr.checkPandigital(x) end) |> Enum.sum
  end

end