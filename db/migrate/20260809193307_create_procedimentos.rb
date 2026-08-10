class CreateProcedimentos < ActiveRecord::Migration[8.1]
  def change
    create_table :procedimentos do |t|
      t.date :data_agendamento
      t.date :data_realizacao
      t.string :status
      t.string :paciente
      t.string :exame
      t.integer :quantidade
      t.decimal :valor

      t.timestamps
    end
  end
end
