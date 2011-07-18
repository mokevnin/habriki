class Web::Communities::BlogsController < Web::Communities::ApplicationController

  def index
    @blogs = community.published_blogs.page params[:page]
  end

end
