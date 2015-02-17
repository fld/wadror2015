class UserDefaults < ActiveRecord::Migration
  def up
    change_column :users, :admin, :boolean, :default => false
    change_column :users, :enabled, :boolean, :default => true
  end
end
