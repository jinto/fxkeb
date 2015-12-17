require 'test_helper'

class FxkebTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Fxkeb::VERSION
  end

  def test_it_does_something_useful
    assert Fxkeb.to_usd(1000) > 0.4
    #assert false
  end
end
