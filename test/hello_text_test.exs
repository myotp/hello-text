defmodule HelloTextTest do
  use ExUnit.Case
  doctest HelloText

  test "greets the world" do
    assert HelloText.hello() == :world
  end
end
