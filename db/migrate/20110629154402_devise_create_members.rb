class DeviseCreateMembers < ActiveRecord::Migration
  def self.up
    create_table(:community_members) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.confirmable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.token_authenticatable

      t.references :community
      t.string :login
      t.string :first_name
      t.string :last_name
      t.string :state

      # t.encryptable

      t.timestamps
    end

    add_index :community_members, :email,                :unique => true
    add_index :community_members, :reset_password_token, :unique => true
    add_index :community_members, :confirmation_token,   :unique => true
    add_index :community_members, :unlock_token,         :unique => true
    add_index :community_members, :authentication_token, :unique => true
  end

  def self.down
    drop_table :community_members
  end
end
