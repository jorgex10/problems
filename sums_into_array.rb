# frozen_string_literal: true
# rubocop:disable Style/Documentation

#   Crea una función que encuentre todas las combinaciones de los números
#   de una lista que suman el valor objetivo.
#   - La función recibirá una lista de números enteros positivos
#     y un valor objetivo.
#   - Para obtener las combinaciones sólo se puede usar
#     una vez cada elemento de la lista (pero pueden existir
#     elementos repetidos en ella).
#   - Ejemplo: Lista = [1, 5, 3, 2],  Objetivo = 6
#     Soluciones: [1, 5] y [1, 3, 2] (ambas combinaciones suman 6)
#     (Si no existen combinaciones, retornar una lista vacía)

class SumFinder
  def initialize(array, target)
    @array = array
    @results = []
    @target = target
  end

  def find_sums
    @array.sort!
    find_sum_into_subarrays(0, @target, [])

    @results.inspect
  end

  private

  def find_sum_into_subarrays(start, target, combination)
    # with solution
    if target.zero?
      @results << combination.dup
      return
    end

    # with no solution
    return if target.negative? || start == @array.length

    # backtraking
    for index in (start..@array.length) do
      next if index > start && @array[index] == @array[index - 1]

      new_target = target - @array[index].to_i
      new_combination = combination.push(@array[index])

      find_sum_into_subarrays(index + 1, new_target, new_combination)
      combination.pop
    end
  end
end

# EXECUTION ---------------------------------

sum_finder = SumFinder.new([1, 5, 3, 2], 6)
puts sum_finder.find_sums
