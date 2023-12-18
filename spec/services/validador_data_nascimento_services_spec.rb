# spec/services/validador_data_nascimento_services_spec.rb
require 'rails_helper'

RSpec.describe ValidadorDataNascimentoServices, type: :service do

    it 'retorna true para uma data válida' do
      expect(ValidadorDataNascimentoServices.validar('25/12/2000')).to be true
      expect(ValidadorDataNascimentoServices.validar('30-11-22')).to be true
      expect(ValidadorDataNascimentoServices.validar('15/05/1990')).to be true
    end
  
    it 'retorna false para uma data com mês inválido' do
      expect(ValidadorDataNascimentoServices.validar('05-15-2022')).to be false
    end
  
    it 'retorna false para uma data com dia, mês ou ano negativo' do
      expect(ValidadorDataNascimentoServices.validar('-25/12/2000')).to be false
      expect(ValidadorDataNascimentoServices.validar('30-11--22')).to be false
      expect(ValidadorDataNascimentoServices.validar('05-15--2022')).to be false
      expect(ValidadorDataNascimentoServices.validar('2023-02--30')).to be false
    end
  
    it 'retorna false para uma data inválida' do
      expect(ValidadorDataNascimentoServices.validar('2023-02-30')).to be false
    end
  
    it 'retorna false para formato de data inválido' do
      expect(ValidadorDataNascimentoServices.validar('2023/02/20')).to be false
    end
  end
  