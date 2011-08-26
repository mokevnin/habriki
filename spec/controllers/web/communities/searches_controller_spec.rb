require 'spec_helper'

describe Web::Communities::SearchesController do
  before do
    @post = Factory :active_community_post
    Community::Post.stub!(:search).and_return(@post.community.posts.all)

    @params = {:community_id => @post.community.to_param}
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :show, @params
      response.should be_success
    end
  end

end

