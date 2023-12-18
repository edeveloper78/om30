# spec/services/validador_services_spec.rb
require 'rails_helper'

RSpec.describe ValidadorCnsServices, type: :service do
  describe '.validar' do
    context 'with a valid CNS' do
      it 'returns true' do
        valid_cns = '123827371030018'

        expect(ValidadorCnsServices.validar(valid_cns)).to be_truthy
      end
    end

    context 'with an invalid CNS' do
      it 'returns false' do
        invalid_cns = '12345678901234'

        expect(ValidadorCnsServices.validar(invalid_cns)).to be_falsey
      end
    end
  end

end
