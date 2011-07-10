class CreateCommunityPosts < ActiveRecord::Migration
  def self.up
    create_table :community_posts do |t|
      t.references :community
      t.references :blog
      t.references :member
      t.string :name
      t.text :body
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :community_posts
  end
end
