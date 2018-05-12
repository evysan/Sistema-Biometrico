class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firtsname
      t.string :lastname
      t.string :gender
      t.string :phone
      t.string :role
      t.integer :identification
      t.string :email

      t.timestamps
    end
  end
end
