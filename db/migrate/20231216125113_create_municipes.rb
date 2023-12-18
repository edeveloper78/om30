class CreateMunicipes < ActiveRecord::Migration[7.0]
  def change
    create_table :municipes do |t|
      t.string :nome_completo
      t.bigint :cpf
      t.string :cns
      t.string :email
      t.date :data_nascimento
      t.string :telefone
      t.string :status

      t.timestamps
    end
  end
end
