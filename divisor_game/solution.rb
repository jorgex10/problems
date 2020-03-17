# frozen_string_literal: true

# @param {Integer} n
# @return {Boolean}

def divisor_game(n)
  return false unless valid?(n)

  n.even?
end

private

def valid?(n)
  n > 1 && n <= 1000
end
