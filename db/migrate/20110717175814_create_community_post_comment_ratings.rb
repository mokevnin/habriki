class CreateCommunityPostCommentRatings < ActiveRecord::Migration
  def self.up
    create_table :community_post_comment_ratings do |t|
      t.references :comment
      t.references :member
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :community_post_comment_ratings
  end
end
