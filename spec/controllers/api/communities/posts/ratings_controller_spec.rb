require 'spec_helper'

describe Api::Communities::Posts::RatingsController do
  render_views

  before do
    @post = Factory 'community/post'
    @params = {:community_id => @post.community.to_param, :post_id => @post.id}
    @member = Factory :active_community_member

    sign_in @member
  end

  describe "POST 'create'" do
    before do
      @attrs = {:value => 1}
    end
    it "should be successful" do
      post :create, @params.merge!(:community_post_rating => @attrs, :format => 'json')
      response.should be_success

      @rating = @post.ratings.first
      @rating.value.should == @attrs[:value]
    end
  end

end


