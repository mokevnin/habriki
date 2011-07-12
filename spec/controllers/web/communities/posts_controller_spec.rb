require 'spec_helper'

describe Web::Communities::PostsController do
  before do
    @post = Factory :active_community_post

    @params = {:community_id => @post.community.to_param}
  end

  describe "GET 'recent'" do
    it "should be successful" do
      get :recent, @params
      response.should be_success
    end
  end

end

