defmodule Elxr do
  
  def fac(0), do: 1
  def fac(a) when a > 0 do
    a * fac(a - 1)
  end

  def divisor(x), do: fac(length(x) - 1)

  def comb(a, b, c) do    
    cond do
      # fac(length(a)) < c -> {a, b, c, "1"}
      fac(length(a)) < c -> raise "Combination number more than count of combinations"
      fac(length(a)) == c -> b ++ Enum.reverse(a)
      c == 1 -> b ++ a
      c == 0 -> raise "Wut?!?! Number of combination starts from 1"
      _ ->
        if rem(c, divisor(a)) == 0, do:
          comb(List.delete_at(a, div(c, divisor(a)) - 1), b ++ [Enum.at(a, div(c, divisor(a)) - 1)], divisor(a)),
          else:
          comb(List.delete_at(a, div(c, divisor(a))), b ++ [Enum.at(a, div(c, divisor(a)))], rem(c, divisor(a)))
    end
  end

  def mainFunc(x) do
    comb(Enum.to_list(0..9), [], x)
  end

  def mainTest do
    mainFunc(1000000)
  end
end