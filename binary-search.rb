class BinarySearch
  attr_accessor :array

  def initialize(array)
    @array = array
  end

  def find(value)
    find_with_ranges(value, 0, array.size - 1)
  end

  def find_with_ranges(value, min, max)
    middle = (min + max) / 2
    mid_value = array[middle]

    return false unless min <= max
    return true if value == mid_value

    if value < mid_value
      find_with_ranges(value, min, middle - 1)
    else
      find_with_ranges(value, middle + 1, max)
    end
  end
end

array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
bs = BinarySearch.new(array)

p '================================='
p bs.find(30)     # false
p bs.find(4)      # true
p bs.find(8)      # true
p bs.find(200)    # false
p '================================='
