require 'spec_helper'

describe Web::Communities::PostsController do
  before do
    @post = Factory :active_community_post
    request.host = @post.community.hostname
  end

  describe "GET 'recent'" do
    it "should be successful" do
      get :recent
      response.should be_success
    end
  end

end

