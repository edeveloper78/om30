class ValidadorCpfServices
	def self.validar(cpf)
			# Remove caracteres não numéricos
			cpf = cpf.gsub(/[^0-9]/, '')

			# Verifica se o CPF possui 11 dígitos
			return false unless cpf.length == 11

			# Calcula o primeiro dígito verificador
			soma = 0
			9.times { |i| soma += cpf[i].to_i * (10 - i) }
			resto = soma % 11
			digito1 = (resto < 2) ? 0 : (11 - resto)

			# Calcula o segundo dígito verificador
			soma = 0
			10.times { |i| soma += cpf[i].to_i * (11 - i) }
			resto = soma % 11
			digito2 = (resto < 2) ? 0 : (11 - resto)

			# Verifica se os dígitos verificadores calculados são iguais aos fornecidos
			return cpf[9, 2].to_i == digito1 * 10 + digito2
	end
end