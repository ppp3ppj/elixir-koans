defmodule Sigils do
  @moduledoc false
  use Koans

  @intro "Sigils"

  koan "The ~s sigil is a different way of expressing string literals" do
    assert ~s{This is a string} == "This is a string"
  end

  koan "Sigils are useful to avoid escaping quotes in strings" do
    assert "\"Welcome to the jungle\", they said." == ~s{\"Welcome to the jungle\", they said.}
  end

  koan "Sigils can use different delimiters" do
    matches? = ~s{This works!} == ~s[This works!]
    assert matches? == true
  end

  koan "The lowercase ~s sigil supports string interpolation" do
    assert ~s[1 + 1 = #{1 + 1}] == ~s{1 + 1 = 2}
  end

  koan "The ~S sigil is similar to ~s but doesn't do interpolation" do
    assert ~S[1 + 1 = #{1+1}] == ~S[1 + 1 = #{1+1}]
  end

  koan "The ~w sigil creates word lists" do
    assert ~w(Hello world) == ["Hello", "world"]
  end

  koan "The ~w sigil also allows interpolation" do
    assert ~w(Hello 1#{1 + 1}3) == ["Hello", "123"]
  end

  koan "The ~W sigil behaves to ~w as ~S behaves to ~s" do
    assert ~W(Hello #{1+1}) == ["Hello", ~S[#{1+1}]]
  end
end
