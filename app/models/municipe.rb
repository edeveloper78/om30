class Municipe < ApplicationRecord
  has_one :endereco
  accepts_nested_attributes_for :endereco, allow_destroy: true
  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize: "200x200"
  end

  validates :cpf, presence: true, length: { is: 11 }, numericality: { only_integer: true }
  validates :nome_completo,:cpf, :cns, :data_nascimento, presence: true
  validates :email,:telefone, :status, presence: true
end
