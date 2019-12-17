defmodule ClojureErlasticHelloworldTest do
  use ExUnit.Case
  doctest ClojureErlasticHelloworld

  test "greets the world" do
    assert ClojureErlasticHelloworld.hello() == :world
  end
end
