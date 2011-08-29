require 'spec_helper'

describe Web::Communities::SearchesController do
  before do
    @post = Factory :active_community_post
    Community::Post.stub!(:search).and_return(@post.community.posts.all)
    request.host = @post.community.hostname
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :show
      response.should be_success
    end
  end

end

