class Community < ActiveRecord::Base

  attr_protected :user

  validates :name, :presence => true
  validates :uri, :presence => true, :uniqueness => true,
    :uri => true, :exclusion => ['mail']

  belongs_to :user
  has_many :members, :dependent => :restrict
  has_many :blogs, :dependent => :destroy
  has_many :published_blogs, :class_name => 'Community::Blog',
    :conditions => {:state => :active}
  has_many :posts, :dependent => :restrict
  has_many :published_posts, :class_name => 'Community::Post',
    :conditions => {:state => :active}
  has_many :comments, :through => :published_posts, :class_name => 'Community::Post::Comment'

  state_machine :initial => :off do
    state :off
    state :active

    event :enable do
      transition all => :active
    end

    event :disable do
      transition all => :off
    end
  end
  state_machine.states.each { |s| scope s.name, where(:state => s.name) }

  def to_param
    uri
  end

  def to_s
    name
  end

  def host
    "http://#{uri}.#{configatron.host_name}" if self.persisted?
  end
end
