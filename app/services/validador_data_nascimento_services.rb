class ValidadorDataNascimentoServices 
    def self.validar(data_str)
		# Define os formatos de data suportados
		formatos_suportados = [
		  /\A\d{2}\/\d{2}\/\d{4}\z/,
		  /\A\d{2}-\d{2}-\d{2}\z/,
		  /\A\d{2}-\d{2}-\d{4}\z/,
		  /\A\d{4}-\d{2}-\d{2}\z/
		]
	  
		# Verifica se a data corresponde a algum dos formatos suportados
		formato_valido = formatos_suportados.any? { |formato| formato.match?(data_str) }
	  
		unless formato_valido
		  return false
		end
	  
		# Extrai o dia, mês e ano da data
		case data_str
		when /\A(\d{2})\/(\d{2})\/(\d{4})\z/, /\A(\d{2})-(\d{2})-(\d{4})\z/
		  dia, mes, ano = $1.to_i, $2.to_i, $3.to_i
		when /\A(\d{2})-(\d{2})-(\d{2})\z/
		  dia, mes, ano = $1.to_i, $2.to_i, $3.to_i + 2000
		when /\A(\d{4})-(\d{2})-(\d{2})\z/
		  dia, mes, ano = $3.to_i, $2.to_i, $1.to_i
		end
	  
		# Verifica se o dia, mês e ano são válidos
		if dia < 1 || mes < 1 || ano < 1
		  return false
		end
	  
		# Verifica se a data é válida usando o módulo Date
		begin
		  Date.new(ano, mes, dia)
		  return true
		rescue ArgumentError
		  return false
		end
	  end
end