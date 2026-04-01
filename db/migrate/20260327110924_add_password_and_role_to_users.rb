class AddPasswordAndRoleToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :password, :string
    add_column :users, :role, :string
  end
end
