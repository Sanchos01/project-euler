defmodule Elxr do
import Enum, only: [reduce: 2, any?: 2, find_index: 2]
  
  def digits(x), do: digits(x, [rem(10, x)], [div(10, x)])
  def digits(x, rs, xs) do
    cond do
      # any?(rs, fn y -> y == rem(10*hd(rs), x) end) && rem(10*hd(rs), x) != 0 -> {x, rs, xs, "recur"}
      any?(rs, fn y -> y == rem(10*hd(rs), x) end) && rem(10*hd(rs), x) != 0 -> {x, find_index(rs, fn z -> z == rem(10*hd(rs), x) end) + 1, xs, "recur"}
      rem(hd(rs), x) == 0 && div(10*hd(rs), x) -> {x, rs, xs}
      true -> digits(x, [rem(10*hd(rs), x)|rs], xs ++ [div(10*hd(rs), x)])
    end
  end

  def lengthRecur({x, _, _}), do: {x, 0}
  def lengthRecur({x, rs, _, "recur"}), do: {x, rs}
  # def lengthRecur({x, rs, xs, "recur"}), do: reverse(xs) |> (fn [y|ys] ->
  #   if y == div(hd(rs) * 10, x), do: {x, 1}, else: lengthRecur({x, 10 * div(hd(rs), x), ys, 1, "step2"}) end).()
  # def lengthRecur({x, _, [], count, "step2"}), do: {x, count}
  # def lengthRecur({x, hdrs, [y|ys], count, "step2"}) do
  #   if y == hdrs, do: {x, count + 1}, else: lengthRecur({x, hdrs, ys, count + 1, "step2"})
  # end

  def mainFunc, do: 1..1000 |> Stream.map(fn x -> x |> digits() |> lengthRecur() end)
    # |> Enum.take(10)
    |> reduce(fn {x1, y1}, {x2, y2} -> if y1 > y2, do: {x1, y1}, else: {x2, y2} end)
end