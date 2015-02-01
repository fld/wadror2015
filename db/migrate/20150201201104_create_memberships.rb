class CreateMemberships < ActiveRecord::Migration
  def change
    drop_table :memberships
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :beerclub_id

      t.timestamps null: false
    end
  end
end
