# frozen_string_literal: true

def sum_terms(n)
  return 0 unless n.positive?

  (1..n).inject(0) { |result, i| result + (i * i) + 1 }
end
