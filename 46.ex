defmodule Elxr do
  
  def primesTo(a) do
    Stream.filter(2..a, fn x -> isPrime(x, primesTo(x)) end)
  end

  def isPrime(2, _xs), do: true
  def isPrime(a, _xs) when rem(a, 2) == 0, do: false
  def isPrime(a, xs) do
    Enum.reduce_while(xs, true, fn x, acc -> cond do
      :math.pow(x, 2) > a -> {:halt, acc}
      rem(a, x) == 0 -> {:halt, false}
      true -> {:cont, acc}
    end end)
  end

  def check(a, xs) do
    Enum.reduce_while(xs, false, fn x, acc ->
      y = :math.sqrt((a - x) / 2)
      cond do
        y == round(y) -> {:halt, true}
        true -> {:cont, acc}
      end
    end)
  end

  def main(a \\ 9, xs \\ Enum.to_list(primesTo(9))) do
    if isPrime(a, xs), do: main(a + 2, xs ++ [a]), else:
      if check(a, xs), do: main(a + 2, xs), else: a
  end

end