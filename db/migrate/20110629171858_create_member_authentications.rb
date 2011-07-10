class CreateMemberAuthentications < ActiveRecord::Migration
  def self.up
    create_table :community_member_authentications do |t|
      t.references :community
      t.references :member
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end

  def self.down
    drop_table :community_member_authentications
  end
end
