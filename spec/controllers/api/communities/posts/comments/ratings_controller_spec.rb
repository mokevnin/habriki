require 'spec_helper'

describe Api::Communities::Posts::Comments::RatingsController do
  render_views

  before do
    @comment = Factory 'community/post/comment'
    @params = {:community_id => @comment.post.community.to_param, :comment_id => @comment.id}
    @member = Factory :active_community_member

    sign_in @member
  end

  describe "POST 'create'" do
    before do
      @attrs = {:value => 1}
    end
    it "should be successful" do
      post :create, @params.merge!(:community_post_comment_rating => @attrs, :format => 'json')
      response.should be_success

      @rating = @comment.ratings.first
      @rating.value.should == @attrs[:value]
    end
  end

end

