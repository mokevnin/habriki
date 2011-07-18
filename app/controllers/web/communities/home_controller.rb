class Web::Communities::HomeController < Web::Communities::ApplicationController
  def index
    @posts = community.posts
  end
end

