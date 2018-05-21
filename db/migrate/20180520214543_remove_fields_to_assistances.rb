class RemoveFieldsToAssistances < ActiveRecord::Migration[5.2]
  def change
    change_column_null :assistances, :fecha_ingreso, false
  end
end
