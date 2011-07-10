class Community::Post < ActiveRecord::Base

  acts_as_taggable

  attr_accessible :blog, :name, :body, :tag_list

  validates :community, :presence => true
  validates :member, :presence => true
  validates :name, :presence => true
  validates :body, :presence => true

  belongs_to :member
  belongs_to :blog
  belongs_to :community
  has_many :comments, :dependent => :destroy

  default_scope order('id DESC')

  define_index do
    indexes name
    indexes body
    has created_at
    has community_id

    where sanitize_sql(:state => :active)
  end

  state_machine :initial => :off do
    state :draft
    state :draft_again
    state :active do
      validates :blog, :presence => true
    end

    event :enable do
      transition all => :active
    end

    event :disable do
      transition all => :off
    end
  end

  def to_s
    name
  end
end
