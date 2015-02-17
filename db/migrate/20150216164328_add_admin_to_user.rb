class AddAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    u = User.first
    u.update_attribute(:admin, true)
  end
end
