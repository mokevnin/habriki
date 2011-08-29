class Web::Communities::HomeController < Web::Communities::ApplicationController
  def index
    @posts = community.published_posts.includes(:blog)
  end
end

