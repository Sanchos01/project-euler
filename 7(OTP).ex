defmodule Elxr do
  import Enum, only: [reverse: 1, reduce_while: 3]
  use GenServer

  def start_link, do: GenServer.start_link(__MODULE__, [], name: :cache)
  def stop, do: GenServer.stop(:cache)

  def add_prime(num), do: GenServer.cast(:cache, {:add_prime, num})
  def get_prime, do: GenServer.call(:cache, :get_prime)

  def handle_call(:get_prime, _from, nums), do: {:reply, reverse(nums), []}  
  def handle_cast({:add_prime, num}, nums), do: {:noreply, [num | nums]}

  def findIndexedPrime(1), do: 2
  def findIndexedPrime(2), do: 3
  def findIndexedPrime(n) do
    start_link()
    indexPrime(n, 5, [3])
  end
  def indexPrime(n, x, primes) do
    case reducing(x, primes) do
      :uncertainty -> case reducing(x, ys = get_prime()) do
                    :uncertainty -> IO.puts("Unacceptable!!1!")
                    :not_prime -> indexPrime(n, x + 2, primes)
                    :prime -> case n do
                                3 -> IO.puts(x)
                                  stop()
                                _ -> add_prime(x)
                                  indexPrime(n - 1, x + 2, primes ++ ys)
                              end
                    end
      :not_prime -> indexPrime(n, x + 2, primes)
      :prime -> case n do
                  3 -> IO.puts(x)
                    stop()
                  _ -> add_prime(x)
                    indexPrime(n - 1, x + 2, primes)
      end
    end
  end

  def reducing(var, primes) do
    reduce_while(primes, :uncertainty, fn x, acc ->
      cond do
        :math.pow(x, 2) > var -> {:halt, :prime}
        rem(var, x) == 0 -> {:halt, :not_prime}
        true -> {:cont, acc}
      end
    end)
  end
end