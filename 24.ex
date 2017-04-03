defmodule Elxr do
  import Enum, only: [reverse: 1, to_list: 1, at: 2]
  import List, only: [delete_at: 2]
  
  def fac(0), do: 1
  def fac(a) when a > 0 do
    a * fac(a - 1)
  end

  def divisor(x), do: fac(length(x) - 1)

  def comb(start, acc, num) do    
    cond do
      fac(length(start)) < num -> raise "Combination number more than count of combinations"
      fac(length(start)) == num -> acc ++ reverse(start)
      num == 1 -> acc ++ start
      num == 0 -> raise "Wut?!?! Number of combination starts from 1"
      true ->
        if rem(num, divisor(start)) == 0, do:
          comb(delete_at(start, div(num, divisor(start)) - 1),
            acc ++ [at(start, div(num, divisor(start)) - 1)], divisor(start)),
          else:
          comb(delete_at(start, div(num, divisor(start))),
            acc ++ [at(start, div(num, divisor(start)))], rem(num, divisor(start)))
    end
  end

  def mainFunc(x) do
    comb(to_list(0..9), [], x)
  end

  def mainTest do
    mainFunc(1000000)
  end
end