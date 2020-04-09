# frozen_string_literal: true

require 'test/unit'

class TestNums < Test::Unit::TestCase
  def test_1
    puts 'Testing 4 * 6 * 3 * 1 / 3'
    assert_equal(24, 4 * 6 * 3 * 1 / 3, 'Incorrect')
  end

  def test_2
    puts 'Testing (1 + 3 + 4) * 3 * 6 / 6'
    assert_equal(24, (1 + 3 + 4) * 3 * 6 / 6, 'Incorrect')
  end

  def test_3
    puts 'Testing 1 / ((1 / 4.0) * (1 / 6.0)* (int(1 / 3) + 1))'
    assert_equal(24, 1 / ((1 / 4.0) * (1 / 6.0) * (1 / 3 + 1)), 'Incorrect')
  end

  def test_4
    puts 'Testing int(1 / 3 + 4 * 6)'
    assert_equal(24, (1 / 3 + 4 * 6), 'Incorrect')
  end
end
