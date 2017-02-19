defmodule Elxr do

  def isPent(a) do
    n = round(:math.sqrt(a / 1.5))
    if n * (3 * n - 1) / 2 == a, do: true, else: false
  end

  def isHex(a) do
    n = round(:math.sqrt(a / 2))
    if n * (2 * n - 1) == a, do: true, else: false
  end

  def indexTrian(a) do
    round(a * (a + 1) / 2)
  end

  def main(a \\ 286) do
    if isPent(indexTrian(a)) && isHex(indexTrian(a)), do: indexTrian(a), else: main(a + 1)
  end

end