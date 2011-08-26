class Api::Communities::Posts::RatingsController < Api::Communities::ApplicationController
  before_filter do
    @post = community.posts.find params[:post_id]
  end

  def create
    @rating = @post.ratings.build(params[:community_post_rating])
    @rating.member = current_community_member
    if @rating.save
      render :json => @rating
    end
  end

end
