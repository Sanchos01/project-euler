defmodule Elxr do
  
  def testik do
    Enum.reverse([3,7,4,2,4,6,8,5,9,3]) |> foldTriangle()
  end

  def countLines(a), do: (:math.sqrt(1 + 8 * length(a)) - 1) / 2

  def foldTriangle(a) do
    cond do
      length(a) == 1 -> hd(a)
      countLines(a) == round(countLines(a)) ->
        Enum.split(a, round(countLines(a) * 2 - 1))
        |> (fn x -> Enum.concat(foldZip(elem(x, 0)), elem(x, 1)) end).()
        |> foldTriangle()
      true -> raise "Something wrong with number of numbers (lul)"
      # true -> a
    end
  end

  def foldZip(a), do: foldZip(Enum.take(a, length(a)/2 |> round), Enum.drop(a, length(a)/2 |> round))
  def foldZip(_, []), do: []
  def foldZip([a|[b|c]], [d|e]) do
    if a+d > b+d, do: [(a+d)|foldZip([b|c], e)], else: [(b+d)|foldZip([b|c], e)]
  end

  def mainFunc do
    Enum.reverse([75,95,64,17,47,82,18,35,87,10,20,04,82,47,65,19,01,23,75,03,34,88,02,77,73,07,63,67,99,65,04,28,06,16,70,92,41,41,26,56,83,40,80,70,33,41,48,72,33,47,32,37,16,94,29,53,71,44,65,25,43,91,52,97,51,14,70,11,33,28,77,73,17,78,39,68,17,57,91,71,52,38,17,14,91,43,58,50,27,29,48,63,66,04,68,89,53,67,30,73,16,69,87,40,31,04,62,98,27,23,09,70,98,73,93,38,53,60,04,23]) |> foldTriangle()
  end

end