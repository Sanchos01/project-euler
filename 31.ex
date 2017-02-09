defmodule Elxr do

  # {a, b, c, d, e, f, g, h}
  def streamComb do
    Stream.unfold({0, 0, 0, 0, 0, 0, 0, 0},
      fn {1,_,_,_,_,_,_,1} -> nil;
      {200,b,c,d,e,f,g,h} -> {{200,b,c,d,e,f,g,h},{0,b+1,c,d,e,f,g,h}};
      {a,100,c,d,e,f,g,h} -> {{a,100,c,d,e,f,g,h},{0,0,c+1,d,e,f,g,h}};
      {a,b,40,d,e,f,g,h} -> {{a,b,40,d,e,f,g,h},{0,0,0,d+1,e,f,g,h}};
      {a,b,c,20,e,f,g,h} -> {{a,b,c,20,e,f,g,h},{0,0,0,0,e+1,f,g,h}};
      {a,b,c,d,10,f,g,h} -> {{a,b,c,d,10,f,g,h},{0,0,0,0,0,f+1,g,h}};
      {a,b,c,d,e,4,g,h} -> {{a,b,c,d,e,4,g,h},{0,0,0,0,0,0,g+1,h}};
      {a,b,c,d,e,f,2,h} -> {{a,b,c,d,e,f,2,h},{0,0,0,0,0,0,0,h+1}};
      {a,b,c,d,e,f,g,h} -> {{a,b,c,d,e,f,g,h}, {a+1,b,c,d,e,f,g,h}} end)
      |> Stream.filter(fn x -> equal2Funt(x) end)
      # |> Enum.to_list()
      |> Enum.reduce(0, fn x, acc -> 1 + acc end)
      # |> Enum.reduce(0, fn x, acc -> if equal2Funt(x), do: acc + 1, else: acc end)
  end

  def combs do # useless
    for a <- 0..10, b <- 0..100, c <- 0..40, d <- 0..20, e <- 0..10, f <- 0..4, g <- 0..2,
      equal2Funt({a,b,c,d,e,f,g,0}), do: {a,b,c,d,e,f,g,0}
  end

  def equal2Funt({a,b,c,d,e,f,g,h}) do
    200 == a + 2 * b + 5 * c + 10 * d + 20 * e + 50 * f + 100 * g + 200 * h
  end

  def main do
    streamComb
    # |> Enum.reduce(0, fn x, acc -> if equal2Funt(x), do: acc + 1, else: acc end)
  end

end