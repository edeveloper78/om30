# spec/services/validador_cpf_services_spec.rb
require 'rails_helper'

RSpec.describe ValidadorCnsServices, type: :service do

  describe '.validar_cpf' do
    context 'with a valid CPF' do
      it 'returns true' do
        valid_cpf = '123.456.789-09'

        expect(ValidadorCpfServices.validar(valid_cpf)).to be_truthy
      end
    end

    context 'with an invalid CPF' do
      it 'returns false' do
        invalid_cpf = '123.456.789-01'

        expect(ValidadorCpfServices.validar(invalid_cpf)).to be_falsey
      end
    end
  end
end