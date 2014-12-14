defmodule PiEstimate do

  def query(n) do
    Random.seed
    count_coordinates_inside_circle(n)
      |> estimate_pi(n)
  end

  defp count_coordinates_inside_circle(n) do
    Enum.reduce(1..n, 0, fn(_n, count) ->
      count + inside_circle?( random_coordinate )
    end)
  end

  defp random_coordinate do
    [Random.uniform, Random.uniform]
  end

  defp inside_circle?([x, y]) when x*x + y*y > 1 do
    0
  end

  defp inside_circle?([_x, _y]) do
    1
  end

  defp estimate_pi(count_inside_circle, count_total) do
    count_inside_circle / count_total * 4
  end
end

defmodule Random do
  def uniform do
    :random.uniform
  end

  def seed do
    :random.seed(:erlang.now)
  end
end

Enum.each([10,100,1_000,10_000,100_000,1_000_000], fn(n) ->
  IO.write "Pi estimated using #{n} random coordinates: "
  PiEstimate.query(n)
    |> IO.puts
end)

