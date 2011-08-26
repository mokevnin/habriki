require 'spec_helper'

describe Api::Communities::Members::RatingsController do
  render_views

  before do
    @member = Factory 'community/member'
    @params = {:community_id => @member.community.to_param, :member_id => @member.id}
    @voter = Factory :active_community_member

    sign_in @voter
  end

  describe "POST 'create'" do
    before do
      @attrs = {:value => 1}
    end
    it "should be successful" do
      post :create, @params.merge!(:community_member_rating => @attrs, :format => 'json')
      response.should be_success

      @rating = @member.ratings.first
      @rating.value.should == @attrs[:value]
    end
  end

end



