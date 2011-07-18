class Api::Communities::Posts::CommentsController < Api::Communities::ApplicationController
  before_filter do
    @post = community.posts.find params[:post_id]
  end

  def create
    @comment = @post.comments.build(params[:community_post_comment])
    if @comment.save
      render :json => @comment
    end
  end

end

