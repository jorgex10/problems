class Reinas
  attr_accessor :number, :table

  def initialize(number)
    @number = number
    @table = []
  end

  def init()
    @number.times do |i|
      @table[i] = Array.new(@number, 0)
    end
  end

  def valid?(row, column)
    return unless valid_values?(row, column)

    validations = []

    # Fila
    row_array = @table[row].dup
    row_array.delete_at(row)
    validations << row_array.all?(0)

    # Columna
    column_array = []
    @number.times do |r|
      column_array << @table[r][column]
    end
    column_array.delete_at(column)
    validations << column_array.all?(0)

    # Diagonal 1
    diag_array = []
    tmp_row = row
    tmp_column = column
    while (tmp_row >= 0 && tmp_column >= 0)
      diag_array << @table[tmp_row][tmp_column]
      tmp_row = tmp_row - 1
      tmp_column = tmp_column - 1
    end
    diag_array.shift
    tmp_row = row + 1
    tmp_column = column + 1
    while (tmp_row < @number && tmp_column < @number)
      diag_array << @table[tmp_row][tmp_column]
      tmp_row = tmp_row + 1
      tmp_column = tmp_column + 1
    end
    validations << diag_array.all?(0)

    # Diagonal 2
    diag_array = []
    tmp_row = row
    tmp_column = column
    while (tmp_row >= 0 && tmp_column < @number)
      diag_array << @table[tmp_row][tmp_column]
      tmp_row = tmp_row - 1
      tmp_column = tmp_column + 1
    end
    diag_array.shift
    tmp_row = row + 1
    tmp_column = column - 1
    while (tmp_row < @number && tmp_column >= 0)
      diag_array << @table[tmp_row][tmp_column]
      tmp_row = tmp_row + 1
      tmp_column = tmp_column - 1
    end
    validations << diag_array.all?(0)

    # Verificamos que todas las validaciones cumplan
    p validations
    validations.all?(true)
  end

  def valid_values?(row, column)
    row >= 0 && row < @number && column >= 0 && column < @number
  end

  def add_reina(row, column)
    @table[row][column] = 1
  end

  def move_right_reina(row, column)
    @table[row][column] = 0
    @table[row][column + 1] = 1
  end

  def recursive(row, tmp_column = -1)
    @table[row].each do |column|
      if valid?(row, column)
        tmp_column = column
        @table[row, column] = 1
        return
      else
        move_right_reina(row, column)
        recursive(row, tmp_column + 1)
      end
    end
  end

  def create()
    @number.times do |row|
      p '---row---'
      recursive(row)
    end
  end
end

reinas = Reinas.new(4)
reinas.init()
reinas.create()

p '=========================================='
p reinas.table
p '=========================================='
