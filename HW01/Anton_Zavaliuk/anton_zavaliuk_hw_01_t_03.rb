# frozen_string_literal: true

require 'test/unit'

# this is the way to test eleven twos equals to 2009
class TestTwos < Test::Unit::TestCase
  def test_2009
    puts 'Testing '
    assert_equal(2009, 22 / 2 - 2 + 2222 - 222, 'Incorrect')
  end

  def test_2009_2
    puts 'Testing #2'
    assert_equal(2009, 2**(22 / 2) - 22 * 2 + 2 * 2 + 2 / 2, 'Incorrect')
  end
end
