class Web::Communities::Members::PostsController < Web::Communities::Members::ApplicationController
  before_filter :authenticate_community_member!, :except => :index

  def index
    scope = member.send(current_community_member ? :posts : :published_posts)
    @posts = scope.page params[:page]

    title 'Posts'
  end

  def new
    @post = current_community_member.posts.build
  end

  def edit
    @post = current_community_member.posts.find params[:id]
  end

  def create
    @post = current_community_member.posts.build(params[:community_post])
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to edit_community_member_post_path(community, member, @post)
    else
      render :action => "new"
    end
  end

  def update
    send :edit
    if @post.update_attributes(params[:community_post])
      flash[:notice] = 'Post was successfully updated.'
      redirect_to :action => :edit
    else
      render :action => "edit"
    end
  end

  def destroy
    send :edit
    @post.destroy

    redirect_to :action => :index
  end
end
