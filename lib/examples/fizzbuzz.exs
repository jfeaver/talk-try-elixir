
## If Statement Free FizzBuzz in Elixir

defmodule FizzBuzz do
  def fizz_word(0, 0, _), do: "FizzBuzz"
  def fizz_word(0, _, _), do: "Fizz"
  def fizz_word(_, 0, _), do: "Buzz"
  def fizz_word(_, _, n), do: n

  def fizz_buzz(n) do
    fizz_word( rem(n,3), rem(n,5), n )
  end

  def result(n) do
    Enum.map(1..n, fn(n) ->
      fizz_buzz(n)
    end)
  end

  def print(n) do
    result(n)
      |> Enum.join(", ")
      |> IO.puts
  end
end

FizzBuzz.print(100)
# $> elixir fizzbuzz.exs
# 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz, 16, 17, Fizz, 19, Buzz,
# Fizz, 22, 23, Fizz, Buzz, 26, Fizz, 28, 29, FizzBuzz, 31, 32, Fizz, 34, Buzz, Fizz, 37, 38, Fizz,
# Buzz, 41, Fizz, 43, 44, FizzBuzz, 46, 47, Fizz, 49, Buzz, Fizz, 52, 53, Fizz, Buzz, 56, Fizz, 58, 59,
# FizzBuzz, 61, 62, Fizz, 64, Buzz, Fizz, 67, 68, Fizz, Buzz, 71, Fizz, 73, 74, FizzBuzz, 76, 77, Fizz,
# 79, Buzz, Fizz, 82, 83, Fizz, Buzz, 86, Fizz, 88, 89, FizzBuzz, 91, 92, Fizz, 94, Buzz, Fizz, 97, 98,
# Fizz, Buzz

