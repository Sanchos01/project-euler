defmodule Elxr do
  import Enum, only: [reduce_while: 3, uniq: 1, reverse: 1]

  def primesTo(a), do: Stream.filter(2..a, fn x -> isPrime(x) end)

  def isPrime(2), do: true
  def isPrime(3), do: true
  def isPrime(a) when rem(a, 2) == 0, do: false
  def isPrime(a), do: reduce_while(primesTo(a), true, fn x, acc -> cond do
    :math.pow(x, 2) > a -> {:halt, true}
    rem(a, x) == 0 -> {:halt, false}
    true -> {:cont, acc}
  end end)

  def digitsToNum([]), do: IO.puts("fn digits-to-nums take empty list")
  def digitsToNum(xs), do: digitsToNum(xs, length(xs))
  defp digitsToNum(xs, 1), do: hd(xs)
  defp digitsToNum([x|xs], n), do: round(x * :math.pow(10, n-1)) + digitsToNum(xs, n-1)

  def variations([], _n), do: []
  def variations(_xs, 0), do: []
  def variations(xs, n) do
    cond do
      xs != uniq(xs) -> IO.puts("Elements not unique")
      n > length(xs) -> IO.puts("n bigger than amount of elements of list")
      true -> variations(xs, [], n)
    end
  end
  defp variations([], ys, _n), do: [ys]
  defp variations(xs, ys, n) do
    reduce_while(xs, [], fn x, acc -> if length(ys) == n, do: {:halt, acc ++ [ys]},
      else: {:cont, acc ++ variations((xs -- [x]), (ys ++ [x]), n)} end)
  end
  def combs(xs), do: variations(xs, length(xs))

  def panNums(a) do
    combs(Enum.take(allDigits, a)) |> reverse() |> Enum.map(fn x -> digitsToNum(x) end)
  end

  def allDigits, do: [1,2,3,4,5,6,7,8,9]

  def biggestPanDigital(a \\ 9) do
    reduce_while(panNums(a), 0, fn x, acc -> cond do
      isPrime(x) -> {:halt, x}
      true -> {:cont, acc}
    end end)
    |> (fn x -> if x == 0, do: biggestPanDigital(a - 1), else: x end).()
  end

end