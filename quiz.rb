class Quiz
  def initialize
    @perguntas_respostas = {
      "Qual é a capital do Brasil?" => "Brasília",
      "Quantos planetas existem no sistema solar?" => "Oito",
      "Quem escreveu 'Dom Quixote'?" => "Miguel de Cervantes",
      "Qual é o maior animal terrestre?" => "Elefante",
      "Quem pintou a 'Mona Lisa'?" => "Leonardo da Vinci"
    }
    @pontuacao = 0
  end

  def jogar_quiz
    puts "Bem-vindo ao Quiz! Responda às perguntas corretamente para ganhar pontos."

    @perguntas_respostas.each do |pergunta, resposta|
      puts pergunta
      print "Sua resposta: "
      resposta_usuario = gets.chomp

      if resposta_usuario.downcase == resposta.downcase
        puts "Resposta correta! +1 ponto"
        @pontuacao += 1
      else
        puts "Resposta incorreta! A resposta correta era: #{resposta}"
      end
    end

    puts "Fim do Quiz! Sua pontuação final é: #{@pontuacao}"
  end
end

def main
  quiz = Quiz.new
  quiz.jogar_quiz
end

main
