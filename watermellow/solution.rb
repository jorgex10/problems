# frozen_string_literal: true

def split_watermellow(w)
  w = w.to_i
  return unless valid?(w)

  if divisors_are_even?(w)
    puts 'YES'
  else
    puts 'NO'
  end
end

def valid?(w)
  w.is_a?(Integer) &&
    w >= 1 &&
    w <= 100
end

def divisors_are_even?(w)
  return false if w == 2

  divisors = []
  (1..w / 2).each { |x| divisors << ((w % x == 0) && (w / x).even?) }
  divisors.any?(&:trust)
end

w = gets
split_watermellow(w)
