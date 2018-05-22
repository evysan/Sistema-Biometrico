class RefactorAssistanceSchema < ActiveRecord::Migration[5.2]
  def change
    remove_column :assistances, :fecha_ingreso, :datetime
    remove_column :assistances, :fecha_egreso, :datetime
    add_column :assistances, :fecha, :datetime
    add_column :assistances, :accion, :string
  end
end
