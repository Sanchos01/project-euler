defmodule Elxr do
  
  def findPrimeDivisors(a, n \\ 2, xs \\ [])
  def findPrimeDivisors(a, n, []) when n >= a, do: []
  def findPrimeDivisors(1, _n, xs), do: xs
  def findPrimeDivisors(a, n, xs) when n >= a, do: xs ++ [a]
  def findPrimeDivisors(a, n, xs) do
    if rem(a, n) == 0, do: findPrimeDivisors(resDiv(a, n), n + 1, xs ++ [maxDiv(a, n)]),
    else: findPrimeDivisors(a, n + 1, xs)
  end

  def maxDiv(a, x, count \\ 0) do
    if rem(a, x) == 0, do: maxDiv(div(a, x), x, count + 1),
    else: round(:math.pow(x, count))
  end

  def resDiv(a, x) do
    if rem(a, x) == 0, do: resDiv(div(a, x), x), else: a
  end

  def nextNumsUniqDivs(a, n) do
    Enum.to_list(a..(a + n - 1))
    |> Enum.map(fn x -> findPrimeDivisors(x) end) |> Enum.concat()
    |> (fn x -> Enum.uniq(x) == x end).()
  end

  def main(n \\ 2, a \\ 2) do
    nums = Enum.to_list(a..(a + n - 1)) |> Enum.reverse()
    Enum.reduce_while(nums, [], fn x, acc -> cond do
      length(findPrimeDivisors(x)) != n -> {:halt, x}
      Enum.uniq(acc) != acc -> {:halt, x}
      true -> {:cont, acc ++ findPrimeDivisors(x)}
    end end)
    |> (fn x -> if is_list(x) do if Enum.uniq(x) == x, do: a, else: main(n, a + 1)
    else main(n, x + 1) end end).()
  end

end