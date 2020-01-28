# @param {Integer} n
# @return {Boolean}

def divisor_game(n)
  return false unless valid?(n)

  i = 0
  while !n.nil?
    n = play(n)
    i = i + 1 unless n.nil? || n == 1
  end

  !i.odd?
end

private

def play(n)
  valid_numbers = []
  n.times do |number|
    valid_numbers << number if valid_play_conditions?(n, number)
  end

  valid_numbers.empty? ? nil : (n - valid_numbers[0])
end

def valid_play_conditions?(n, number)
  number > 0 &&
    number < n &&
    n % number == 0
end

def valid?(n)
  n > 1 && n<=1000
end
