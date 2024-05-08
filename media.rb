def calcular_media(numeros)
  soma = numeros.reduce(0) { |acc, num| acc + num }
  media = soma.to_f / numeros.length
  media
end

def main
  numeros = []

  puts "Bem-vindo ao calculador de média!"
  puts "Insira uma lista de números (digite 'fim' para calcular a média):"

  loop do
    input = gets.chomp
    break if input.downcase == 'fim'

    numero = input.to_f
    numeros << numero
  end

  if numeros.empty?
    puts "Nenhum número inserido. Programa encerrado."
  else
    media = calcular_media(numeros)
    puts "A média dos números inseridos é: #{media}"
  end
end

main
