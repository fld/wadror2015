class RenameNameClubId < ActiveRecord::Migration
  def self.up
    rename_column :memberships, :beer_club_id, :beerclub_id
  end
end
