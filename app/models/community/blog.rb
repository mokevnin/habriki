class Community::Blog < ActiveRecord::Base

  validates :name, :presence => true
  validates :uri, :uri => true, :presence => true, :uniqueness => {:scope => :community_id}

  belongs_to :community
  has_many :posts, :dependent => :restrict
  has_many :published_posts, :class_name => 'Community::Post',
    :conditions => {:state => :active}

  state_machine :initial => :off do
    state :off
    state :active do
      validate :uri, :precense => true
    end

    event :enable do
      transition all => :active
    end

    event :disable do
      transition all => :off
    end
  end

  def to_param
    uri
  end

  def to_s
    name
  end
end
