class Community::Member::Rating < ActiveRecord::Base
  belongs_to :member
  belongs_to :voter, :class_name => 'Community::Member'
end
