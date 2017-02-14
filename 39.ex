defmodule Elxr do
import Enum, only: [reduce_while: 3]
import :math, only: [pow: 2]
  
  def findTriangleNums(a) do
    Enum.reduce(2..round(a/4), [], fn x, acc -> 
      if checkSolution(x, a) == [], do: acc, else: acc ++ checkSolution(x, a)
    end)
  end

  def checkSolution(x, a) do
    reduce_while(2..round(a/2), [], fn y, acc -> cond do
      x + y > a -> {:halt, []}
      pow(x, 2) + pow(y, 2) == pow(a - x - y, 2) -> {:halt, [{x, y, a - x - y}]}
      true -> {:cont, acc}
    end end)
  end

  def main do
    10..1000 |> Enum.map(fn x -> [x, length(findTriangleNums(x))] end)
    |> Enum.max_by(fn x -> List.last(x) end)
  end

end