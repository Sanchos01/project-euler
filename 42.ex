defmodule Elxr do

  def isNumTriangle(a) do
    trunc(:math.sqrt(2 * a)) * (trunc(:math.sqrt(2 * a) + 1)) == 2 * a
  end

  def fileToList(file) do
    file |> String.replace(",", " ") |> String.replace("\"", "")
    |> String.split()
  end

  def charToNum(char) do
    Enum.find_index("A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
      |> String.split() |> Enum.map(fn x -> String.to_charlist(x) end),
      fn x -> x == char end) |> (fn x -> if x == nil, do: 0, else: x + 1 end).()
  end

  def charlistToNum([]), do: 0
  def charlistToNum([char|charlist]) do
    charToNum([char]) + charlistToNum(charlist)
  end

  def main do
    {:ok, file} = File.read("words.txt")
    fileToList(file)
    |> Enum.map(fn x -> String.to_charlist(x) |> charlistToNum() end)
    |> Enum.filter(fn x -> isNumTriangle(x) end)
    |> length()
  end

end