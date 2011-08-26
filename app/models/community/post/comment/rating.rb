class Community::Post::Comment::Rating < ActiveRecord::Base

  attr_accessible :value

  validates :comment, :presence => true
  validates :member, :presence => true
  validates :value, :presence => true, :inclusion => [-1, 1]

  belongs_to :comment
  belongs_to :member
end
