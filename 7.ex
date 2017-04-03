defmodule Elxr do
  import Enum, only: [reverse: 1, reduce_while: 3]

  def findIndexedPrime(1), do: 2
  def findIndexedPrime(2), do: 3
  def findIndexedPrime(n), do: findIndexedPrime(n, 5, [3], [])
  def findIndexedPrime(n, var, xs, cache) do
    case reducing(var, xs) do
      :ok -> findIndexedPrime(n, var, xs ++ reverse(cache), [])
      :cache -> if n == 3, do: var,
          else: findIndexedPrime(n - 1, var + 2, xs, [var|cache])
      :next -> findIndexedPrime(n, var + 2, xs, cache)
    end
  end

  def reducing(var, xs) do
    reduce_while(xs, :ok, fn x, acc -> cond do
      :math.pow(x, 2) > var -> {:halt, :cache}
      rem(var, x) == 0 -> {:halt, :next}
      true -> {:cont, acc}
    end end)
  end

end