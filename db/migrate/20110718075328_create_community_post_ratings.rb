class CreateCommunityPostRatings < ActiveRecord::Migration
  def self.up
    create_table :community_post_ratings do |t|
      t.references :post
      t.references :member
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :community_post_ratings
  end
end
