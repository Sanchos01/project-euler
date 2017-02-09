defmodule Elxr do
	
	def sPrimesTo(n) do
		Stream.filter(2..n, &(isPrime(&1)))
	end

  def isPrime(x) when x < 2, do: false
  def isPrime(2), do: true
	def isPrime(var) do
		cond do
			true -> Enum.reduce_while(sPrimesTo(var), true, fn x, acc -> cond do
				:math.pow(x, 2) > var -> {:halt, acc}
				rem(var, x) == 0 -> {:halt, false}
				true -> {:cont, acc}
			end end)
		end
	end

  def streamPossForms do
    Stream.unfold({-998, 2},
      fn {_, 1000} -> nil;
      {999, b} -> {{999, b}, {-998, b + 1}};
      {a, b} -> {{a, b}, {a + 1, b}} end)
      |> Stream.filter(fn x -> isPrime(elem(x, 1)) && isPrime(1 + elem(x,0) + elem(x,1)) end)
  end

  def maxPrimes({a, b}), do: maxPrimes({a, b}, 2)
  def maxPrimes({a, b}, c), do: if isPrime(c * c + c * a + b), do: maxPrimes({a, b}, c+1),
    else: c

    def main do
      Enum.max_by(streamPossForms, fn x -> maxPrimes(x) end)
    end

end