require 'spec_helper'

describe Web::Communities::HomeController do
  before do
    @post = Factory :active_community_post
    request.host = @post.community.hostname
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end

end
