require 'spec_helper'

describe Web::Communities::Blogs::PostsController do
  render_views

  before do
    @post = Factory :active_community_post
    @params = {:community_id => @post.community.to_param, :blog_id => @post.blog.to_param}
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index, @params
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :show, @params.merge!(:id => @post.to_param)
      response.should be_success
    end
  end

end



