defmodule Elxr do
  import Enum

  def primesTo(a), do: Stream.filter(2..a, fn x -> isPrime(x) end)

  def isPrime(2), do: true
  def isPrime(3), do: true
  def isPrime(a) when rem(a, 2) == 0, do: false
  def isPrime(a), do: reduce_while(primesTo(a), true, fn x, acc -> cond do
    :math.pow(x, 2) > a -> {:halt, true}
    rem(a, x) == 0 -> {:halt, false}
    true -> {:cont, acc}
  end end)

  def countNums(a) do
    if div(a, 10) > 0, do: 1 + countNums(div(a, 10)), else: 1
  end

  def numToDigits(a), do: numToDigits(a, countNums(a))
  def numToDigits(a, 1), do: [a]
  def numToDigits(a, b), do: numToDigits(div(a, 10), b - 1, [rem(a, 10)])
  def numToDigits(a, 1, xs), do: [a|xs]
  def numToDigits(a, b, xs), do: numToDigits(div(a, 10), b - 1, [rem(a, 10)|xs])

  def digitsToNum([]), do: IO.puts("fn digits-to-nums take empty list")
  def digitsToNum(xs), do: digitsToNum(xs, length(xs))
  defp digitsToNum(xs, 1), do: hd(xs)
  defp digitsToNum([x|xs], n), do: round(x * :math.pow(10, n-1)) + digitsToNum(xs, n-1)
  
  # def variations([], _n), do: []
  # def variations(_xs, 0), do: []
  # def variations(xs, n) do
  #   cond do
  #     xs != uniq(xs) -> IO.puts("Elements not unique")
  #     n > length(xs) -> IO.puts("n bigger than amount of elements of list")
  #     true -> variations(xs, [], n)
  #   end
  # end
  # defp variations([], ys, _n), do: [ys]
  # defp variations(xs, ys, n) do
  #   reduce_while(xs, [], fn x, acc -> if length(ys) == n, do: {:halt, acc ++ [ys]},
  #     else: {:cont, acc ++ variations((xs -- [x]), (ys ++ [x]), n)} end)
  # end

  def listPotential do
    primesTo(10000) |> reject(fn x -> x < 1000 end)
    |> map(fn x -> numToDigits(x) end)
  end

  def sameElems([], _ys), do: true
  def sameElems([x|xs], ys) do
    if any?(ys, fn y -> x == y end), do: sameElems(xs, ys), else: false
  end

  def main(xs \\ listPotential) do
    reduce_while(xs, [], fn x0, acc ->
      xss = filter(xs, fn x1 -> sameElems(x0, x1) end)
      cond do
        length(acc) == 6 -> {:halt, acc}
        length(xss) >= 3 -> {:cont, acc ++ [x0]}
        true -> {:cont, acc}
      end
    end)
  end

end