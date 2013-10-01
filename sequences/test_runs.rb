require "runs"
require "minitest"
require "minitest/autorun"

class TestRuns2 < Minitest::Test
  def setup
    @runs = Runs.new(3)
  end

  def ups_downs(inc=1)
    ups = (-2..2).collect { |n| [n, n+inc] }
    ups.concat(ups.collect(&:reverse))
  end

  def test_run_up
    assert @runs.run?([1, 2, 3])
    assert @runs.run?([0, 1, 2])
    assert @runs.run?([-1, 0, 1])
    assert @runs.run?([-3, -2, -1])
  end

  def test_run_down
    assert @runs.run?([3, 2, 1])
    assert @runs.run?([2, 1, 0])
    assert @runs.run?([1, 0, -1])
    assert @runs.run?([0, -1, -2])
    assert @runs.run?([-1, -2, -3])
  end

  def test_non_runs
    refute @runs.run?([1, 2, 4])
    refute @runs.run?([10, 7, 6])
    refute @runs.run?([-1, 0, -1])
    refute @runs.run?([-10, -10, 5])
  end

  def test_given_sequence
    assert_equal @runs.find_runs([1, 2, 3, 5, 10, 9, 8, 9, 10, 11, 7]), [0, 4, 6, 7]
  end

  def test_some_sequences
    [[[4, -14, -13, -12, -4, -3, -2, -8, -7, -6], [1, 4, 7]],
     [[-20, 14, 15, 16, -2, -1, 0], [1, 4]],
     [[-9, -8, -7, -6, 13, 14, 15], [0, 1, 4]],
     [[17, 18, 6, 7, 8, 9, 10], [2, 3, 4]]].each do |arr, runs|
        assert_equal @runs.find_runs(arr), runs
    end
  end
end
