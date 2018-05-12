class CreateAssistances < ActiveRecord::Migration[5.2]
  def change
    create_table :assistances do |t|
      t.datetime :fecha_ingreso
      t.datetime :fecha_egreso
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
