require 'spec_helper'

describe Web::Communities::Members::CommentsController do
  render_views

  before do
    @comment = Factory 'community/post/comment'
    @post = @comment.post
    @params = {:community_id => @post.community.to_param, :member_id => @post.member.to_param}
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index, @params
      response.should be_success
    end
  end

end



