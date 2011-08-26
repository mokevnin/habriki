class Community::Member < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :validatable,
         :recoverable, :rememberable, :trackable

  attr_accessible :login, :email, :password, :password_confirmation, :remember_me

  validates :community, :presence => true
  validates :email, :email => true, :presence => true, :uniqueness => true
  validates :login, :presence => true, :uniqueness => {:scope => :community_id}

  belongs_to :community, :autosave => true
  has_many :posts do
    def build(*args)
      post = super
      post.community = proxy_owner.community
      post
    end
  end
  has_many :comments, :class_name => 'Post::Comment'
  has_many :ratings

  before_create :generate_confirmation_token

  state_machine :initial => :waiting_email_confirm do
    state :off
    state :waiting_email_confirm
    state :active

    event :enable do
      transition all => :active
    end

    before_transition :waiting_email_confirm => :active do |user, transition|
      user.confirmed_at = Time.now
    end
  end

  class << self
    def confirmation_token
      generate_token(:confirmation_token)
    end
  end

  def to_param
    login
  end

  def to_s
    login
  end

  def generate_confirmation_token
    self.confirmed_at = nil
    self.confirmation_token = self.class.confirmation_token
    self.confirmation_sent_at = Time.now.utc
  end
end
