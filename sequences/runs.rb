class Runs
  def initialize(run_size)
    @run_size = run_size
  end

  def find_runs(arr)
    idx, result = 0, []
    last_idx = arr.size - @run_size + 1
    while idx < last_idx
      slice = arr.slice(idx, @run_size)
      result << idx if run?(slice)
      idx += 1
    end
    result
  end

  def run?(arr)
    return false if arr.size < @run_size
    delta = arr[1] - arr[0]
    (@run_size-1).times.inject(true) { |acc, n| acc &= arr[n] + delta == arr[n+1] }
  end
end
