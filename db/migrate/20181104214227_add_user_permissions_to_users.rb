class AddUserPermissionsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_permissions, :string
  end
end
