# frozen_string_literal: true

#   Crea una función que al dar un par de coordenadas en una matriz
#   pinte todos de un color dado si esta encerrada en una figura.
#   Si no esta encerrada en una figura entonces se pinta todo lo restante.
#   (Se asemeja a la funcionalidad de trazos en paint cuando pintamos
#   una forma cerrada y solo se pinta la forma cerrada, pero si hacemos
#   click en otra parte entonces se pinta toda la parte seleccionada).

def fill(canvas, x, y, color)
  # Some code here
end

canvas = [
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 1, 1, 0, 0],
  [0, 1, 0, 0, 0, 1, 0],
  [0, 1, 0, 0, 0, 1, 0],
  [0, 1, 0, 0, 0, 1, 0],
  [0, 0, 1, 1, 1, 0, 0],
  [0, 0, 0, 0, 0, 0, 0]
]

result = [
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 1, 1, 0, 0],
  [0, 1, 1, 1, 1, 1, 0],
  [0, 1, 1, 1, 1, 1, 0],
  [0, 1, 1, 1, 1, 1, 0],
  [0, 0, 1, 1, 1, 0, 0],
  [0, 0, 0, 0, 0, 0, 0]
]

puts fill(canvas, 3, 3, 1)
