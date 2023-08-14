defmodule ChatCliTest do
  use ExUnit.Case
  doctest ChatCli

  test "greets the world" do
    assert ChatCli.hello() == :world
  end
end
