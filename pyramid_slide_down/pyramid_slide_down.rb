def longest_slide_down(pyramid)
  sum = 0
  pos = 0

  pyramid.each do |sub_array|
    case sub_array.size
    when 1
      max = sub_array[0]
    when 2
      max = sub_array.max
    else
      max = [sub_array[pos], sub_array[pos + 1]].max
    end
    sum = sum + max
    pos = sub_array.each_with_index.select { |x, i| i if x == max && (i == pos || i == pos + 1) }.flatten.last
  end

  sum
end
