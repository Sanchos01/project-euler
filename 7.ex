defmodule Elxr do

  def findIndexedPrime(n), do: findIndexedPrime(n, 3, [2], [])
  def findIndexedPrime(n, var, xs, cache) do
    if Enum.reduce_while(xs, true, fn y, acc -> cond do
      :math.pow(y, 2) > var -> {:halt, acc}
      rem(var, y) == 0 -> {:halt, false}
      true -> {:cont, acc}
    end end) do cond do
      :math.pow(List.last(xs), 2) < var -> findIndexedPrime(n, var, xs++Enum.reverse(cache), [])
      n == 2 -> var
      true -> findIndexedPrime(n - 1, var + 2, xs, [var|cache])
    end else findIndexedPrime(n, var + 2, xs, cache)
    end
  end

end