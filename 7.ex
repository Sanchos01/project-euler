defmodule Elxr do

  def findIndexedPrime(n), do: findIndexedPrime(n, 3, [2])
  def findIndexedPrime(n, var, xs) do
    cond do
      n == length xs -> List.last(xs)
      # n == length xs -> hd(xs)
      Enum.reduce_while(xs, true, fn y, acc -> cond do
        :math.pow(y, 2) > var -> {:halt, acc}
        rem(var, y) == 0 -> {:halt, false}
        true -> {:cont, acc}
      end end) -> findIndexedPrime(n, var + 1, xs ++ [var])
      true -> findIndexedPrime(n, var + 1, xs)
    end
  end
end