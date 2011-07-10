class Web::Communities::Blogs::PostsController < Web::Communities::ApplicationController

  def index
    @posts = blog.published_posts.paginate :page => params[:page]
  end

  def show
    @post = blog.published_posts.find params[:id]

    title @post
  end

  private

  def blog
    @_blog ||= community.published_blogs.find_by_uri! params[:blog_id]
  end
end

