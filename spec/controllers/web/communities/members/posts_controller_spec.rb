require 'spec_helper'

describe Web::Communities::Members::PostsController do
  render_views

  before do
    @member = Factory :active_community_member
    @community = @member.community
    @post = Factory :active_community_post, :community => @community, :member => @member
    sign_in @member

    @params = {:member_id => @member.to_param}
    request.host = @community.hostname
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index, @params
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new, @params
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should be successful" do
      attrs = Factory.attributes_for 'community/post'
      blog = Factory :active_community_blog, :community => @community
      attrs[:blog_id] = blog.id
      post :create, @params.merge!(:community_post => attrs)
      response.should be_redirect

      p = @community.posts.find_by_name attrs[:name]
      p.should be
      p.blog.should == blog
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get :edit, @params.merge!(:id => @post.to_param)
      response.should be_success
    end
  end

  describe "PUT 'update'" do
    it "should be successful" do
      attrs = Factory.attributes_for 'community/post'
      post :update, @params.merge!(:id => @post.to_param, :community_post => attrs)
      response.should be_redirect

      @post.reload
      @post.name.should == attrs[:name]
    end
  end

  describe "DELETE 'destroy'" do
    it "should be successful" do
      delete :destroy, @params.merge!(:id => @post.to_param)
      response.should be_redirect

      @community.posts.exists?(@post.id).should_not be
    end
  end

end
