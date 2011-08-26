require 'spec_helper'

describe Api::Communities::Posts::CommentsController do
  render_views

  before do
    @post = Factory :active_community_post
    @params = {:community_id => @post.community.to_param, :post_id => @post.to_param}
    @member = Factory :active_community_member

    sign_in @member
  end

  describe "POST 'create'" do
    before do
      @attrs = Factory.attributes_for 'community/post/comment'
    end
    it "should be successful" do
      post :create, @params.merge!(:community_post_comment => @attrs, :format => 'json')
      response.should be_success

      @post.comments.should have(1).items
    end
  end

end




