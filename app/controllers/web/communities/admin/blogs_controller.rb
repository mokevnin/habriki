class Web::Communities::Admin::BlogsController < Web::Communities::Admin::ApplicationController

  def index
    @blogs = community.blogs
    title 'Blogs'
  end

  def new
    @blog = Community::Blog.new
    title 'New blog'
  end

  def create
    @blog = community.blogs.build(params[:community_blog])
    if @blog.save
      flash[:notice] = 'Blog was successfully created.'
      redirect_to :action => :index
    else
      render :action => "new"
      title 'New blog'
    end
  end

  def edit
    @blog = community.blogs.find_by_uri! params[:id]
    title 'Edit blog'
  end

  def update
    send :edit
    if @blog.update_attributes(params[:community_blog])
      flash[:notice] = 'Blog was successfully updated.'
      redirect_to :action => :index
    else
      render :action => "edit"
    end
  end

  def destroy
    send :edit
    @blog.destroy
    redirect_to :action => :index
  end
end
