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

  def variationsToL(xs, ys, n) do
    reduce_while(xs, [], fn x, acc -> if length(ys) == n, do: {:halt, acc ++ [ys]},
      else: {:cont, acc ++ variations((xs -- [x]), ([x] ++ ys), n)} end)
  end

  def combs([], _), do: []
  def combs(xs, 1), do: xs
  def combs(xs, n), do: combs(xs, [], n)
  def combs(xs, ys, n) do
    reduce_while(xs, [], fn x, acc -> if length(ys) == n, do: {:halt, acc ++ [ys]},
      else: {:cont, acc ++ combs(xs, ys ++ [x], n)} end)
  end

  def combsR(a), do: variations([1,2,3,4,5,6,7,8,9], numToDigits(a), countNums(a)+1)
    |> Enum.map(fn x -> digitsToNum(x) end)
  def combsL(a), do: variationsToL([1,2,3,4,5,6,7,8,9], numToDigits(a), countNums(a)+1)
    |> Enum.map(fn x -> digitsToNum(x) end)

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
  def isTruncPrimeR(xs) when length(xs) == 1, do: isPrime(hd(xs))
  def isTruncPrimeR([_|xs]), do: isPrime(digitsToNum(xs)) && isTruncPrimeR(xs)
  def isTruncPrimeL(xs) when length(xs) == 1, do: isPrime(hd(xs))
  def isTruncPrimeL(xs) do
    ys = List.delete_at(xs, length(xs) - 1)
    isPrime(digitsToNum(ys)) && isTruncPrimeL(ys)
  end

  def biggerTrunc(a) do
    (combsL(a) |> Enum.filter(fn x -> isTruncPrime(x) end)) ++
    (combsR(a) |> Enum.filter(fn x -> isTruncPrime(x) end))
  end

  def main do
    combs([1,2,3,5,7,9], 5)
    |> Enum.reject(fn xs -> hd(xs) == 1 && hd(xs) == 9 end)
    |> Enum.map(fn x -> combs([3,7], x, 6) end)
    # |> Enum.filter(fn xs -> hd(xs) != 1 && List.last(xs) != 1 end)
    |> Enum.reduce([], fn x, acc -> acc ++ Enum.map(x, fn y -> digitsToNum(y) end) end)
    # |> Enum.filter(fn x -> isPrime(x) && isTruncPrime(x) end)
  end

end