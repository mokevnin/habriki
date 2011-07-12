require 'spec_helper'

describe Web::Communities::SearchController do
  before do
    @post = Factory :active_community_post
    Community::Post.stub!(:search).and_return(@post.community.posts.all)

    @params = {:community_id => @post.community.to_param}
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index, @params
      response.should be_success
    end
  end

end

