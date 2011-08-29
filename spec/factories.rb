FactoryGirl.define do

  sequence :email do |n|
    "#{n}@gmail.com"
  end

  sequence :name do |n|
    "name-#{n}"
  end

  sequence :uri do |n|
    "uri-#{n}"
  end

  factory :user do
    email { Factory.next(:email) }
    first_name { Factory.next :name }
    last_name { Factory.next :name }
    password 'password'
    password_confirmation 'password'
  end

  factory :active_user, :parent => :user do
    after_build do |u|
      u.enable
    end
  end

  factory 'community/member' do
    association :community, :factory => :active_community
    login { Factory.next(:name) }
    email { Factory.next(:email) }
    first_name { Factory.next(:name) }
    last_name { Factory.next(:name) }
    password 'password'
    password_confirmation 'password'
  end

  factory :active_community_member, :parent => 'community/member' do
    after_build do |m|
      m.enable
    end
  end

  factory :community do
    uri { Factory.next(:uri) }
    name { Factory.name }
    association :user, :factory => :active_user
  end

  factory :active_community, :parent => :community do
    after_build do |o|
      o.enable
    end
  end

  factory 'community/blog' do
    uri { Factory.next(:uri) }
    name { Factory.next(:name) }
    association :community, :factory => :active_community
  end

  factory :active_community_blog, :parent => 'community/blog' do
    after_create do |b|
      b.enable!
    end
  end

  factory 'community/post' do
    name { Factory.next(:name) }
    body { Factory.next(:name) }
    association :member, :factory => :active_community_member
    after_build do |p|
      p.community = p.member.community
      p.blog = Factory :active_community_blog, :community => p.community
    end
  end

  factory :active_community_post, :parent => 'community/post' do
    after_create do |p|
      p.enable!
    end
  end

  factory 'community/post/comment' do
    body { Factory.next(:name) }
    association :member, :factory => :active_community_member
    association :post, :factory => :active_community_post
  end
end
