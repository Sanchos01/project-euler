defmodule Elxr do
  import Enum, only: [reduce_while: 3, max_by: 2, to_list: 1]
  import Stream, only: [unfold: 2, filter: 2]
	
	def sPrimesTo(n), do: filter(2..n, &(isPrime(&1)))
  def primesTo(n), do: sPrimesTo(n) |> to_list()

  def isPrime(x) when x < 2, do: false
  def isPrime(2), do: true
	def isPrime(var) do
		cond do
			true -> reduce_while(sPrimesTo(var), true, fn x, acc -> cond do
				:math.pow(x, 2) > var -> {:halt, acc}
				rem(var, x) == 0 -> {:halt, false}
				true -> {:cont, acc}
			end end)
		end
	end

  def inOrdList(_a, []), do: false
  def inOrdList(a, [x|xs]) do
    cond do
      a < x -> inOrdList(a, xs)
      a == x -> true
      true -> false
    end
  end

  def streamPossForms(xs \\ primesTo(2000)) do
    unfold({-998, 2},
      fn {_, 1000} -> nil;
      {999, b} -> {{999, b}, {-998, b + 1}};
      {a, b} -> {{a, b}, {a + 1, b}} end)
        |> filter(fn x -> inOrdList(elem(x, 1), xs)
          && inOrdList(1 + elem(x, 0) + elem(x, 1), xs) end)
  end

  def maxPrimes({a, b}), do: maxPrimes({a, b}, 2)
  def maxPrimes({a, b}, c), do: if isPrime(c * c + c * a + b), do: maxPrimes({a, b}, c+1),
    else: c

    def main do
      max_by(streamPossForms(), fn x -> maxPrimes(x) end)
    end

end