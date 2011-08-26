class Api::Communities::Members::RatingsController < Api::Communities::ApplicationController
  before_filter do
    @member = community.members.find params[:member_id]
  end

  def create
    @rating = @member.ratings.build(params[:community_member_rating])
    @rating.voter = current_community_member
    if @rating.save
      render :json => @rating
    end
  end

end

