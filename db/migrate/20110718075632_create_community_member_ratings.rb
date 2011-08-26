class CreateCommunityMemberRatings < ActiveRecord::Migration
  def self.up
    create_table :community_member_ratings do |t|
      t.references :member
      t.references :voter
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :community_member_ratings
  end
end
