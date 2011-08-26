class Community::Post::Rating < ActiveRecord::Base
  belongs_to :post
  belongs_to :member
end
