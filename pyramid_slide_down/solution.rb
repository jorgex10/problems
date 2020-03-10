# frozen_string_literal: true

def longest_slide_down(pyramid)
  sum = 0
  pos = 0

  pyramid.each do |sub_array|
    max = case sub_array.size
          when 1
            sub_array[0]
          when 2
            sub_array.max
          else
            [sub_array[pos], sub_array[pos + 1]].max
          end
    sum += max
    pos = sub_array.each_with_index.select do |x, i|
      i if x == max && (i == pos || i == pos + 1)
    end .flatten.last
  end

  sum
end
