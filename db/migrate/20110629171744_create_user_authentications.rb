class CreateUserAuthentications < ActiveRecord::Migration
  def self.up
    create_table :user_authentications do |t|
      t.references :user
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end

  def self.down
    drop_table :user_authentications
  end
end
