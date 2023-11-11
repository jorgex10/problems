# frozen_string_literal: true

# KATA FROM CODEWARS
#
# Write a function called `sumIntervals/sum_intervals()` that accepts an array of intervals, and returns the sum of all
# the interval lengths. Overlapping intervals should only be counted once.
#
## Intervals
# Intervals are represented by a pair of integers in the form of an array. The first value of the interval
# will always be less than the second value. Interval example: `[1, 5]` is an interval from 1 to 5.
# The length of this interval is 4.
#
# Overlapping Intervals
# List containing overlapping intervals:
# ```
# [
#    [1,4],
#    [7, 10],
#    [3, 5]
# ]
# ```
# The sum of the lengths of these intervals is 7. Since [1, 4] and [3, 5] overlap,
# we can treat the interval as [1, 5], which has a length of 4.
#
# Examples:
# ```
# sumIntervals( [
#    [1,2],
#    [6, 10],
#    [11, 15]
# ] ); // => 9
#
# sumIntervals( [
#    [1,4],
#    [7, 10],
#    [3, 5]
# ] ); // => 7
#
# sumIntervals( [
#    [1,5],
#    [10, 20],
#    [1, 6],
#    [16, 19],
#    [5, 11]
# ] ); // => 19
# ```

# SumIntervals
class SumIntervals
  def initialize(array)
    @array = array
    @results = []
  end

  def calculate
    (0..@array.length).each do |index|
      merge_overlapping_arrays(index, index + 1)
    end

    calculate_intervals
  end

  private

  def merge_overlapping_arrays(start, next_index)
    return if next_index == @array.length

    initial_sub_array = @array[start]
    next_sub_array = @array[next_index]

    return if next_sub_array.nil?

    if next_sub_array[0] < initial_sub_array[1]
      new_sub_array = [initial_sub_array[0], next_sub_array[1]]
      @array.delete_if { |a| a == initial_sub_array }
      @array.delete_if { |a| a == next_sub_array }
      @array.unshift(new_sub_array)
    end

    merge_overlapping_arrays(start, next_index + 1)
  end

  def calculate_intervals
    total_sum = 0
    @array.each do |sub_array|
      total_sum += sub_array[1] - sub_array[0]
    end

    puts total_sum
  end
end

# EXECUTION --------------------------------

array = [[1, 2], [6, 10], [11, 15]] # ==> 9
# array = [[1, 4], [7, 10], [3, 5]] # ==> 7
# array = [[1, 5], [10, 20], [1, 6], [16, 19], [5, 11]] # ==> 19

sum_intervals = SumIntervals.new(array)
sum_intervals.calculate
