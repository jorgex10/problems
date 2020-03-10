# frozen_string_literal: true

def rot13(secret_messages)
  traduced_message = []
  message_arr = secret_messages.to_s.split(' ')
  message_arr.each do |word|
    new_word = []
    word.split('').each do |char|
      new_word << replace(char)
    end
    traduced_message << new_word.join
  end
  [traduced_message.join(' ')]
end

def replace(char)
  pos = get_group[char]
  alternatives = get_group.select { |key| get_group[key] == pos }
  return char if alternatives.empty?

  alternatives.delete(char)
  new_char = alternatives.keys.first
  new_char
end

def group
  result = {}
  ('a'..'m').each_with_index { |letter, index| result.merge!(letter => (index + 1)) }
  ('A'..'M').each_with_index { |letter, index| result.merge!(letter => (index + 100)) }
  ('n'..'z').each_with_index { |letter, index| result.merge!(letter => (index + 1)) }
  ('N'..'Z').each_with_index { |letter, index| result.merge!(letter => (index + 100)) }
  result
end
