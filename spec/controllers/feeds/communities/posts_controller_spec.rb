require 'spec_helper'

describe Feeds::Communities::PostsController do
  render_views

  before do
    @post = Factory :active_community_post

    request.host = @post.community.hostname
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index, :format => :rss
      response.should be_success
    end
  end

end

