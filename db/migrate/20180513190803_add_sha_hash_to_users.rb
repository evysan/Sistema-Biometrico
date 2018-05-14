class AddShaHashToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :shahash, :string
  end
end
