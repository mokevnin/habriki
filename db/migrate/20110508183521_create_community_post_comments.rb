class CreateCommunityPostComments < ActiveRecord::Migration
  def self.up
    create_table :community_post_comments do |t|
      t.references :post
      t.references :member
      t.string :state
      t.string :ancestry
      t.text :body

      t.timestamps
    end

    add_index :community_post_comments, :ancestry
  end

  def self.down
    drop_table :community_post_comments
  end
end
