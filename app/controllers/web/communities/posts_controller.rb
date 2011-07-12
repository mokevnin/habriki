class Web::Communities::PostsController < Web::Communities::ApplicationController
  def recent
    community.posts.last(10)
  end
end
