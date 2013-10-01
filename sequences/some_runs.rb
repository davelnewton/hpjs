require "runs"

class RunsUtils
  def generate_random_run(n=11, max=20, pct=60)
    arr = []
    n.times do |n|
      delta = rand(50) <= 50 ? -1 : 1
      arr << ((rand(100) <= pct) && (n >= 1) ? arr[n-1] + 1 : rand(max*2)-max)
    end
    arr
  end

  def dump_runs(arr)
    runs = Runs.new(3)
    result = runs.find_runs arr
    puts arr.inspect
    puts result.inspect
      puts "-"*20
  end

  def dump_n_runs(n)
    n.times do
      dump_runs generate_random_run(rand(7)+5)
    end
  end
end

utils = RunsUtils.new

utils.dump_runs [1, 2, 3, 4, 5]
utils.dump_runs [1, 2, 4, 3, 2]
utils.dump_runs [1, 2, 3, 5, 10, 9, 8, 9, 10, 11, 7]
utils.dump_n_runs 5
