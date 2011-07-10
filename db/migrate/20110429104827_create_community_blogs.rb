class CreateCommunityBlogs < ActiveRecord::Migration
  def self.up
    create_table :community_blogs do |t|
      t.string :name
      t.string :uri
      t.references :community
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :community_blogs
  end
end
