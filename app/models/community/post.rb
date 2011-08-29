class Community::Post < ActiveRecord::Base

  acts_as_taggable

  attr_accessible :blog_id, :name, :body, :state_event, :tag_list

  validates :community, :presence => true
  validates :blog, :presence => true
  validates :member, :presence => true
  validates :name, :presence => true
  validates :body, :presence => true

  belongs_to :member
  belongs_to :blog
  belongs_to :community
  has_many :comments, :dependent => :destroy
  has_many :ratings, :dependent => :destroy

  default_scope order('id DESC')

  define_index do
    indexes name
    indexes body
    has created_at
    has community_id

    where sanitize_sql(:state => :active)
  end

  state_machine :initial => :draft do
    state :draft
    state :draft_again
    state :active

    event :enable do
      transition all => :active
    end

    event :disable do
      transition all => :draft
    end
  end

  def to_s
    name
  end
end
