class Community::Post < ActiveRecord::Base

  acts_as_taggable

  attr_protected :state

  validate :community, :presence => true
  validate :member, :presence => true
  validate :name, :presence => true
  validate :body, :presence => true

  belongs_to :member
  belongs_to :blog
  belongs_to :community
  has_many :comments, :dependent => :destroy

  default_scope order('id DESC')

  define_index do
    indexes name
    indexes body
    has created_at

    where sanitize_sql(:state => :active)
  end

  state_machine :initial => :off do
    state :draft
    state :draft_again
    state :active do
      validate :blog, :presence => true
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
