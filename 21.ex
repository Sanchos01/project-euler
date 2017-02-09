defmodule Elxr do

  def findSumDivisors(a) do
    if a == 1, do: 0, else:
      Enum.reduce(1..(a-1), fn x, acc -> if rem(a,x)==0, do: acc+x, else: acc end)
  end

  def sumAmicableNumsUnder(a) do
    Enum.reduce(2..(a-1), 0, fn x, acc -> if x == findSumDivisors(findSumDivisors(x))
        && findSumDivisors(x)<a && findSumDivisors(x)!=x, do:
      acc + x, else: acc end)
  end

  def mainFunc, do: sumAmicableNumsUnder(10000)

end