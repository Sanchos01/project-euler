defmodule Elxr do

  def findSumDivisors(a) when a > 0 do
    if a == 1, do: 0, else:
      Enum.reduce(1..round(:math.sqrt(a)), fn x, acc -> if rem(a,x)==0,
        do: (if x == :math.sqrt(a), do: acc + x, else: acc+x+a/x), else: acc end)
  end

  def isAbundant?(x), do: if findSumDivisors(x) > x, do: true, else: false

  def streamAbundantNumsTo(a), do: Stream.filter(1..a, &(isAbundant?(&1)))
  def listAbundantNumsTo(a), do: streamAbundantNumsTo(a) |> Enum.to_list()
  def streamAbundantNums, do: streamAbundantNumsTo(28123)
  def listAbundantNums, do: streamAbundantNums |> Enum.to_list()

  def sumAbundant?(a, xs) do
    Enum.reduce_while(xs, false, fn x, acc ->
      cond do
        x > a/2 -> {:halt, acc}
        isAbundant?(a - x) -> {:halt, true}
        true -> {:cont, acc}
      end
    end)
  end

  def streamAbundantSumsTo(a) do
    Stream.filter(23..a, fn x -> sumAbundant?(x, streamAbundantNums) end)
  end

  def mainFunc do
    Enum.reduce(1..28123, 0, fn x, acc -> if sumAbundant?(x, streamAbundantNums), do: acc, else: acc + x end)
  end
end