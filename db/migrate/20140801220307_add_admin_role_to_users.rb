class AddAdminRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin_role, :boolean, :null => false, :default => false
  end
end
