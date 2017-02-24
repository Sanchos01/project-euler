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

  def cutTail([]), do: []
  def cutTail(xs), do: [xs] ++ cutTail(xs -- [List.last(xs)])
  
  def consVariants([]), do: []
  def consVariants(xs) when length(xs) == 1, do: [xs]
  def consVariants(xs) do
    cutTail(xs) ++ consVariants(tl(xs))
  end

  def checkTo(a) do
    reduce_while(primesTo(10000), [], fn x, acc -> if sum(acc) < a,
      do: {:cont, acc ++ [x]}, else: {:halt, acc} end) |> length()
  end

  def main(a \\ 1000000) do
    primesTo(1000000000) |> Enum.take(checkTo(a))
    |> consVariants() |> sort_by(fn x -> length(x) end) |> reverse
    |> filter(fn x -> sum(x) < a end) |> reduce_while(0, fn x, acc ->
      summa = sum(x)
      if isPrime(summa), do: {:halt, summa}, else: {:cont, acc} end)
  end

end