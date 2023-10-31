class QuickSort
  attr_accessor :array

  def initialize(array)
    @array = array
  end

  def sort
    recursive_sort(array)
  end

  private

  def recursive_sort(array)
    return [] unless array.size.positive?

    left = []
    right = []
    pivot = array[0]
    array.shift

    array.each do |element|
      if element < pivot
        left.push(element)
      else
        right.push(element)
      end
    end

    [].concat(recursive_sort(left), [pivot], recursive_sort(right))
  end
end

array = [4, 9, 2, 1, 6, 3, 8]
qs = QuickSort.new(array)

p '===================================='
p qs.sort
p '===================================='
