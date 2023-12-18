# spec/controllers/municipes_controller_spec.rb

require 'rails_helper'

RSpec.describe MunicipesController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    # Add more index action tests as needed
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end

    # Add more new action tests as needed
  end

  describe 'GET #edit' do
    before do
      @municipe = Municipe.create(
        nome_completo: 'John Doe',
        cpf: '48460251870',
        cns: '159973021840009',
        email: 'john@example.com',
        telefone: '55555555',
        data_nascimento: '1990-01-01',
        status: 'Ativo',
        endereco_attributes: {
          cep: '12345-678',
          logradouro: 'Rua Example',
          complemento: 'Apto 123',
          bairro: 'Bairro Example',
          cidade: 'Cidade Example',
          uf: 'EX',
          codigo_ibege: '1234567'
        }
      )
    end

    it 'returns a successful response' do
      # Exemplo com rota nomeada
      get :edit, params: { id: @municipe.id }
      expect(response).to be_successful
    
    end
  end

  describe 'POST #create' do
    let(:valid_params) do
      {
        nome_completo: 'John Doe',
        cpf: '48460251870',
        cns: '159973021840009',
        email: 'john@example.com',
        data_nascimento: '1990-01-01',
        telefone: '123456789',
        status: 'active',
        endereco_attributes: { cep: '12345-678', logradouro: 'Street 123', complemento: 'Apt 4', bairro: 'Downtown', cidade: 'City', uf: 'CA', codigo_ibege: '123' }
      }
    end

    context 'with valid parameters' do
      it 'creates a new municipe' do
        expect {
          post :create, params: { municipe: valid_params }
        }.to change(Municipe, :count).by(1)
      end

      it 'redirects to the root path' do
        post :create, params: { municipe: valid_params }
        expect(response).to redirect_to(root_path)
      end

      # Add more create action tests as needed
    end

    context 'with invalid parameters' do
      # Add tests for invalid parameters
    end
  end

  describe 'PATCH #update' do
    before do
      allow(controller).to receive(:atualiza_municipe).and_return(true)

      @municipe = Municipe.create(
        nome_completo: 'John Doe',
        cpf: '48460251870',
        cns: '159973021840009',
        email: 'john@example.com',
        telefone: '55555555',
        data_nascimento: '1990-01-01',
        status: 'Ativo',
        endereco_attributes: {
          cep: '12345-678',
          logradouro: 'Rua Example',
          complemento: 'Apto 123',
          bairro: 'Bairro Example',
          cidade: 'Cidade Example',
          uf: 'EX',
          codigo_ibege: '1234567'
        }
      )
    end

    let(:valid_params) do
      {
        nome_completo: 'John Doe',
        cpf: '48460251870',
        cns: '159973021840009',
        email: 'john@example.com',
        data_nascimento: '1990-01-01',
        telefone: '123456789',
        status: 'active',
        endereco_attributes: { cep: '12345-678', logradouro: 'Street 123', complemento: 'Apt 4', bairro: 'Downtown', cidade: 'City', uf: 'CA', codigo_ibege: '123' }
      }
    end

    context 'with valid parameters' do
      it 'updates the municipe' do
        patch :update, params: { id: @municipe.id, municipe: valid_params }
        @municipe.reload
        expect(@municipe.nome_completo).to eq(valid_params[:nome_completo])
      end

      it 'redirects to the root path' do
        patch :update, params: { id: @municipe.id, municipe: valid_params }
        expect(response).to redirect_to(root_path)
      end

    end

    context 'with invalid parameters' do
    end
  end
end
