class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  validate :email, :presence => true, :email => true, :uniqueness => true
  validate :first_name, :presence => true
  validate :last_name, :presence => true

  has_many :communities, :dependent => :destroy
  has_many :active_communities, :class_name => 'Community',
    :conditions => {:state => :active}, :dependent => :restrict
  has_many :authentications, :dependent => :destroy

  state_machine :initial => :waiting_email_confirm do
    state :waiting_email_confirm
    state :active

    event :enable do
      transition all => :active
    end

    before_transition :waiting_email_confirm => :active do |user, transition|
      user.confirmed_at = Time.now
    end
  end

  def to_s
    first_name + ' ' + last_name
  end
end

