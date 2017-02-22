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

  def listPotential do
    primesTo(10000) |> reject(fn x -> x < 1000 end)
    |> map(fn x -> numToDigits(x) end)
  end

  def sameElems([], []), do: true
  def sameElems(xs, ys) when length(xs) != length(ys), do: false
  def sameElems([x|xs], ys) do
    if any?(ys, fn y -> y == x end), do: sameElems(xs, ys -- [x]), else: false
  end

  def findWithSame(xs \\ listPotential, res \\ [])
  def findWithSame([], res), do: res
  def findWithSame([x0|xs0], res) do
    xs1 = filter(xs0, fn x -> sameElems(x0, x) end)
    if length([x0|xs1]) >= 3, do: findWithSame(xs0 -- xs1, [[x0|xs1]|res]),
      else: findWithSame(xs0 -- xs1, res)
  end

  def isArithmeticProg(xs, n \\ 0)
  def isArithmeticProg(xs, _n) when length(xs) < 2, do: true
  def isArithmeticProg([x0|[x1|xs]], n) do
    if n == 0 || x1 - x0 == n, do: isArithmeticProg([x1|xs], x1 - x0), else: false
  end

  def combinations([], _n), do: []
  def combinations(_xs, 0), do: []
  def combinations(xs, n) do
    cond do
      xs != uniq(xs) -> IO.puts("Elements not unique")
      n > length(xs) -> IO.puts("n bigger than amount of elements of list")
      true -> combinations(xs, n, :p)
    end
  end
  defp combinations(xs, n, :p) when length(xs) == n, do: [xs]
  defp combinations(xs, 1, :p), do: map(xs, fn x -> [x] end)
  defp combinations([x|xs], n, :p) do
    map(combinations(xs, n - 1, :p), fn y -> [x|y] end) ++ combinations(xs, n, :p)
  end

  def main do
    findWithSame() |> map(fn x -> map(x, fn y -> digitsToNum(y) end) end)
    |> map(fn x -> combinations(x, 3) end) |> concat()
    |> filter(fn x -> isArithmeticProg(x) end)
  end

end