defmodule Elxr do
import Enum, only: [reverse: 1, reduce_while: 3, sum: 1]

  def findSumDivisors(a) when a > 0 do
    if a == 1, do: 0, else:
      Enum.reduce(1..round(:math.sqrt(a)), fn x, acc -> if rem(a,x)==0,
        do: (if x == :math.sqrt(a), do: acc + x, else: acc+x+a/x), else: acc end)
  end

  def isAbundant?(x), do: if findSumDivisors(x) > x, do: true, else: false
  def streamAbundantNums, do: Stream.filter(1..28123, &(isAbundant?(&1)))
  def listAbundantNums, do: streamAbundantNums |> Enum.to_list()

  def listSums(a, xs) do
    reduce_while(xs, [], fn x, acc -> if x + a > 28123, do: {:halt, acc},
      else: {:cont, [(x+a)|acc]} end) |> reverse()
  end

  def sortUniqLists(xs, []), do: xs
  def sortUniqLists([], xs), do: xs
  def sortUniqLists([x|xs], [y|ys]) do
    cond do
      x < y -> [x|sortUniqLists(xs, [y|ys])]
      x == y -> sortUniqLists(xs, [y|ys])
      true -> [y|sortUniqLists([x|xs], ys)]
    end
  end

  def listUniqSums(xs \\ listAbundantNums) do
    Enum.reduce(xs, [], fn x, acc -> listSums(x, xs) |> sortUniqLists(acc) end)
  end

  def main do
    sum(1..28123) - sum(listUniqSums)
  end
end