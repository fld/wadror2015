class UniqMembership < ActiveRecord::Migration
  def change
    add_index :memberships, [:user_id, :beerclub_id], unique: true
  end
end
