defmodule Elxr do

  def isPent(a) do
    n = round(:math.sqrt(a / 1.5))
    if n * (3 * n - 1) / 2 == a, do: true, else: false
  end

  def isHex(a) do
    n = round(:math.sqrt(a / 2))
    if n * (2 * n - 1) == a, do: true, else: false
  end

  def indexPent(a) do
    round(a * (3 * a - 1) / 2)
  end
  
  def minDiff(a \\ 1, n \\ 1, acc \\ 100000000) do
    fst = indexPent(a)
    snd = indexPent(a + n)
    cond do
      (snd + fst) < indexPent(a + n + 1) -> minDiff(a + 1, 1, acc)
      (snd - fst) > acc -> minDiff(a + 1, 1, acc)
      isPent(snd - fst) && isPent (snd + fst) -> if (snd - fst) < acc,
        do: minDiff(a + 1, 1, (snd - fst)), else: minDiff(a + 1, 1, acc)
      n > 10000 -> minDiff(a + 1, 1, acc)
      a > 10000 -> acc
      true -> minDiff(a, n + 1, acc)
    end
  end

end