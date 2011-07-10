Habriki::Application.routes.draw do

  namespace 'api' do

  end

  namespace 'm', :module => 'mobile' do
    resources :communities, :only => [:show] do
      resources :posts, :only => [:show]
    end
  end

  scope :module => 'web' do
    root :to => 'home#index'

    namespace 'account' do
      resource :user
      resources :communities
    end

    scope :path => 'd' do
      devise_for :users
    end
    resources :users, :only => [:edit, :update]

    constraints(SubdomainConstraint) do
      namespace 'community', :path => nil, :module => nil do
        scope 'communities/:community_id' do
          root :to => 'communities/home#index'
          scope :module => 'communities' do
            scope :path => 'd' do
              devise_for :members, :class_name => 'Community::Member'
              namespace 'member', :path => 'members', :module => nil do
                resource :confirmation, :only => [:show]
              end
            end
            resources :members, :only => [:index]
            scope :module => 'members' do
              resources :members, :only => [:show, :edit, :update] do
                resources :posts
              end
            end
            resources :blogs, :only => [:index, :show] do
              scope :module => 'blogs' do
                resources :posts, :only => [:index, :show]
              end
            end
            resources :posts, :only => [] do
              resources :comments, :only => [:create]
            end
            resources :search, :only => [:index]
            resources :feeds, :only => [:index]
            namespace 'admin' do
              root :to => 'home#index'
              resources :blogs
            end
          end
        end
      end
    end
  end

end

