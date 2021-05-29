defmodule GenServerStackTest do
  use ExUnit.Case
  doctest GenServerStack

  test "greets the world" do
    assert GenServerStack.hello() == :world
  end
end
