Factory.sequence :email do |n|
  "#{n}@gmail.com"
end

Factory.sequence :name do |n|
  "name-#{n}"
end

Factory.sequence :uri do |n|
  "uri-#{n}"
end

Factory.define :user do |f|
  f.email { Factory.next(:email) }
  f.first_name 'first name'
  f.last_name 'last name'
  f.password 'password'
  f.password_confirmation 'password'
end

Factory.define :active_user, :parent => :user do |f|
  f.after_build do |u|
    u.enable
  end
end

Factory.define 'community/member' do |f|
  f.association :community, :factory => :active_community
  f.login { Factory.next(:name) }
  f.email { Factory.next(:email) }
  f.password 'password'
  f.password_confirmation 'password'
end

Factory.define :active_community_member, :parent => 'community/member' do |f|
  f.after_build do |m|
    m.enable
  end
end

Factory.define :community do |f|
  f.uri { Factory.next(:uri) }
  f.name { Factory.name }
  f.association :user, :factory => :active_user
end

Factory.define :active_community, :parent => :community do |f|
  f.after_build do |o|
    o.enable
  end
end

Factory.define 'community/blog' do |f|
  f.uri { Factory.next(:uri) }
  f.name { Factory.next(:name) }
  f.association :community, :factory => :active_community
end

Factory.define :active_community_blog, :parent => 'community/blog' do |f|
  f.after_create do |b|
    b.enable!
  end
end

Factory.define 'community/post' do |f|
  f.name { Factory.next(:name) }
  f.body { Factory.next(:name) }
  f.association :blog, :factory => :active_community_blog
  f.association :member, :factory => :active_community_member
  f.after_build do |p|
    p.community = p.member.community
  end
end

Factory.define :active_community_post, :parent => 'community/post' do |f|
  f.after_create do |p|
    p.enable!
  end
end
