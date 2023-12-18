class ValidadorCnsServices

	def self.validar(cns)
		 # Verifica se o CNS possui 15 dígitos
		 return false unless cns =~ /^\d{15}$/

		 # Divide o CNS em partes para cálculo do dígito verificador
		 base = cns[0, 14].chars.map(&:to_i)
		 digito_verificador = cns[14].to_i
	 
		 # Calcula o dígito verificador
		 soma = 0
		 base.each_with_index do |digito, index|
			 soma += digito * (15 - index)
		 end
		 resto = soma % 11
		 resultado = 11 - resto
	 
		 # Verifica se o dígito verificador calculado é válido
		 if resultado == 11
			 resultado = 0
		 end
	 
		 return resultado == digito_verificador
	end	
end