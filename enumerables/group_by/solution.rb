# frozen_string_literal: true

def group_by_marks(marks, pass_marks)
  result = { 'Failed' => [], 'Passed' => [] }
  marks.group_by { |key, value| value > pass_marks ? result['Passed'] << [key, value] : result['Failed'] << [key, value] }

  result.reject { |_key, value| value.empty? }
end
