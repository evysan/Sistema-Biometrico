class ChangeDefaultValueToUsersState < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :state, "Inactivo"
  end
end
