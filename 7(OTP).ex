defmodule Elxr do
  import Enum, only: [reverse: 1, reduce_while: 3]
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: :cache)
  end

  def add_prime(num) do
    GenServer.cast(:cache, {:add_prime, num})
  end

  def get_prime do
    GenServer.call(:cache, :get_prime)
  end

  def handle_call(:get_prime, _from, nums) do
    {:reply, reverse(nums), []}
  end

  def handle_cast({:add_prime, num}, nums) do
    {:noreply, [num | nums]}
  end

  def findIndexedPrime(1), do: 2
  def findIndexedPrime(2), do: 3
  def findIndexedPrime(n) do
    start_link()
    indexPrime(n, 5, [3])
  end
  def indexPrime(n, x, primes) do
    case reducing(x, primes) do
      :not_yet -> case reducing(x, ys = get_prime()) do
                    :not_yet -> IO.puts("Unacceptable!!1!")
                    :next -> indexPrime(n, x + 2, primes)
                    :final -> case n do
                                3 -> IO.puts(x)
                                _ -> add_prime(x)
                                  indexPrime(n - 1, x + 2, primes ++ ys)
                              end
                    end
      :next -> indexPrime(n, x + 2, primes)
      :final -> case n do
                  3 -> IO.puts(x)
                  _ -> add_prime(x)
                    indexPrime(n - 1, x + 2, primes)
      end
    end
  end

  def reducing(var, primes) do
    reduce_while(primes, :not_yet, fn x, acc ->
      cond do
        :math.pow(x, 2) > var -> {:halt, :final}
        rem(var, x) == 0 -> {:halt, :next}
        true -> {:cont, acc}
      end
    end)
  end
end