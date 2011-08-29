Habriki::Application.routes.draw do

  constraints :format => 'json' do
    namespace 'api' do
      namespace 'community', :path => nil, :module => nil do
        scope 'communities/:community_id' do
          scope :module => 'communities' do
            resources :members, :only => [] do
              scope :module => 'members' do
                resources :ratings, :only => [:create]
              end
            end
            resources :posts, :only => [] do
              scope :module => 'posts' do
                resources :ratings, :only => [:create]
                resources :comments, :only => [:create]
              end
            end
            scope :module => 'posts' do
              resources :comments, :only => [] do
                scope :module => 'comments' do
                  resources :ratings, :only => [:create]
                end
              end
            end
          end
        end
      end
    end
  end

  namespace 'm', :module => 'mobile' do
    resources :communities, :only => [:show] do
      resources :posts, :only => [:show]
    end
  end

  namespace 'feeds' do
    scope :module => 'communities' do
      resources :posts, :only => [:index]
    end
  end

  scope :module => 'web' do
    constraints(SubdomainConstraint) do
      namespace 'community', :path => nil, :module => nil do
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
              resources :comments, :only => [:index]
              resources :posts
            end
          end
          resources :blogs, :only => [:index, :show] do
            scope :module => 'blogs' do
              resources :posts, :only => [:index, :show]
            end
          end
          resources :posts, :only => [] do
            collection do
              get :recent
            end
          end
          resources :tags, :only => [:show]
          resource :search, :only => [:show]
          namespace 'admin' do
            root :to => 'home#index'
            resources :blogs
          end
        end
      end
    end

    root :to => 'home#index'

    namespace 'account' do
      resource :user
      resources :communities
    end

    scope :path => 'd' do
      devise_for :users
    end
    resources :users, :only => [:edit, :update]
  end

end

