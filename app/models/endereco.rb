class Endereco < ApplicationRecord
  belongs_to :municipe
  validates :cep, :logradouro, :complemento, :bairro, :cidade, :uf, :codigo_ibege,  presence: true
end
