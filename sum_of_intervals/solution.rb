# frozen_string_literal: true

def sum_of_intervals(intervals)
  intervals.sort!
  intervals = overlapping_intervals(intervals)

  sum = 0
  intervals.each do |array|
    sum += (array[1] - array[0])
  end

  sum
end

def overlapping_intervals(intervals)
  max_value = 0
  indexes_to_delete = []
  array_to_be_insented = []

  intervals.each_with_index do |array, i|
    next if i.zero?

    max_value = intervals[i - 1][1]
    next if array[0] > max_value

    range_first = (intervals[i - 1][0]..intervals[i - 1][1]).to_a
    range_second = (array[0]..array[1]).to_a

    next if (range_first & range_second).empty?

    indexes_to_delete << i - 1
    indexes_to_delete << i
    array_to_be_insented << [range_first[0], range_second[-1]]
  end

  elements = []
  intervals.each_with_index do |e, i|
    elements << e unless indexes_to_delete.include?(i)
  end
  array_to_be_insented.map { |array| elements.push(array) }

  elements
end
