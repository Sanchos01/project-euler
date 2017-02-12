defmodule Elxr do
  import Enum, only: [reverse: 1, reduce_while: 3]

  def findIndexedPrime(1), do: 2
  def findIndexedPrime(2), do: 3
  def findIndexedPrime(n), do: findIndexedPrime(n, 5, [3], [])
  def findIndexedPrime(n, var, xs, cache) do
    case reducing(var, xs) do
      1 -> findIndexedPrime(n, var, xs ++ reverse(cache), [])
      2 -> if n == 3, do: var, else: findIndexedPrime(n - 1, var + 2, xs, [var|cache])
      3 -> findIndexedPrime(n, var + 2, xs, cache)
    end
  end

  def reducing(var, xs) do
    reduce_while(xs, 1, fn x, acc -> cond do
      :math.pow(x, 2) > var -> {:halt, 2}
      rem(var, x) == 0 -> {:halt, 3}
      true -> {:cont, acc}
    end end)
  end

end