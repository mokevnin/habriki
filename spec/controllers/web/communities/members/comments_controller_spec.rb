require 'spec_helper'

describe Web::Communities::Members::CommentsController do
  render_views

  before do
    @comment = Factory 'community/post/comment'
    @post = @comment.post
    @params = {:member_id => @post.member.to_param}
    request.host = @post.community.hostname
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index, @params
      response.should be_success
    end
  end

end



