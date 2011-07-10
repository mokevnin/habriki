require 'spec_helper'

describe Web::Communities::FeedsController do
  render_views

  before do
    @post = Factory :active_community_post
    @params = {:community_id => @post.community.to_param}
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index, @params.merge!(:format => 'rss')
      response.should be_success
    end
  end

end

