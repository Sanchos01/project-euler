defmodule Elxr do
import Enum, only: [reduce_while: 3, uniq: 1]

  def primesTo(a) do
    Stream.filter(2..a, fn x -> isPrime(x) end)
  end

  def isPrime(1), do: false
  def isPrime(2), do: true
  def isPrime(a) do
    reduce_while(primesTo(a), true, fn x, acc -> cond do
      :math.pow(x, 2) > a -> {:halt, acc}
      rem(a, x) == 0 -> {:halt, false}
      true -> {:cont, acc}
    end end)
  end

  def variations([], _), do: []
  def variations(_, 0), do: []
  def variations(xs, n) do
    cond do
      xs != uniq(xs) -> IO.puts("Elements not unique")
      n > length(xs) -> IO.puts("n bigger than amount of elements of list")
      true -> variations(xs, [], n)
    end
  end
  def variations([], ys, _), do: [ys]
  def variations(xs, ys, n) do
    reduce_while(xs, [], fn x, acc -> if length(ys) == n, do: {:halt, acc ++ [ys]},
      else: {:cont, acc ++ variations((xs -- [x]), (ys ++ [x]), n)} end)
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

  def isTruncPrime(a) when is_integer(a), do: if a<10, do: false,
    else: isTruncPrime(numToDigits(a))
  def isTruncPrime(xs), do: isTruncPrimeL(xs) && isTruncPrimeR(xs)
  def isTruncPrimeL(xs) when length(xs) == 1, do: isPrime(hd(xs))
  def isTruncPrimeL([_|xs]), do: isPrime(digitsToNum(xs)) && isTruncPrimeL(xs)
  def isTruncPrimeR(xs) when length(xs) == 1, do: isPrime(hd(xs))
  def isTruncPrimeR(xs) do
    ys = List.delete_at(xs, length(xs) - 1)
    isPrime(digitsToNum(ys)) && isTruncPrimeR(ys)
  end

  def allTruncRPrimes, do: allTruncRPrimes([[2],[3],[5],[7]], [], 2)
  defp allTruncRPrimes([], ys, _), do: ys
  defp allTruncRPrimes(xs0, ys, n) do
    xs = Enum.reduce(xs0, [], fn x, acc -> acc ++ variations([1,2,3,4,5,6,7,8,9], x, n) end)
    |> Enum.filter(fn x -> isPrime(digitsToNum(x)) end)
    allTruncRPrimes(xs, ys ++ Enum.map(xs, fn x -> digitsToNum(x) end), n + 1)
  end

  def main do
    allTruncRPrimes |> Enum.filter(fn x -> isTruncPrimeL(numToDigits(x)) end) |> Enum.sum()
  end

end