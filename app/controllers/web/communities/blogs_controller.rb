class Web::Communities::BlogsController < Web::Communities::ApplicationController

  def index
    @blogs = community.published_blogs.paginate :page => params[:page]
  end

end
