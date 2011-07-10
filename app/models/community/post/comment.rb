class Community::Post::Comment < ActiveRecord::Base

  validate :body, :precense => true

  belongs_to :post
  belongs_to :member

end
