class Web::Communities::CommentsController < Web::Communities::ApplicationController

  before_filter do
    @post = community.posts.find params[:post_id]
  end

end
