class Api::Communities::Posts::Comments::RatingsController < Api::Communities::ApplicationController
  before_filter do
    @comment = community.comments.find params[:comment_id]
  end

  def create
    @rating = @comment.ratings.build(params[:community_post_comment_rating])
    @rating.member = current_community_member
    if @rating.save
      render :json => @rating
    end
  end

end


