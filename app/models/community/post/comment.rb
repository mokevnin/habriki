class Community::Post::Comment < ActiveRecord::Base

  attr_accessible :body

  validate :body, :precense => true

  belongs_to :post
  belongs_to :member
  has_many :ratings

end
