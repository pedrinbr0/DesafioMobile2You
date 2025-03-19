def extrair_diamantes(expressao)
  pilha = []
  diamantes = 0

  expressao.each_char do |char|
    if char == '<'
      pilha.push(char)
    elsif char == '>' && !pilha.empty?
      pilha.pop
      diamantes += 1
    end
  end

  diamantes
end

expressao = "<<.<<..>><>><.>.>.<<.>.<.>>>><>><>>"
resultado = extrair_diamantes(expressao)
puts "Quantidade de diamantes extraídos: #{resultado}"
