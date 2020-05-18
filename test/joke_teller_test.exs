defmodule JokeTellerTest do
  use ExUnit.Case
  doctest JokeTeller

  test "greets the world" do
    assert JokeTeller.hello() == :world
  end
end
