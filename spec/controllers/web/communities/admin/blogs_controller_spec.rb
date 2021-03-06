require 'spec_helper'

describe Web::Communities::Admin::BlogsController do
  render_views

  before do
    @blog = Factory 'community/blog'
    @community = @blog.community
    @user = @community.user
    sign_in @user

    request.host = @community.hostname
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should be successful" do
      attrs = Factory.attributes_for 'community/blog'
      post :create, :community_blog => attrs
      response.should be_redirect

      blog = @community.blogs.find_by_uri attrs[:uri]
      blog.should be
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get :edit, :id => @blog.to_param
      response.should be_success
    end
  end

  describe "PUT 'update'" do
    it "should be successful" do
      attrs = Factory.attributes_for 'community/blog'
      post :update, :id => @blog.to_param, :community_blog => attrs
      response.should be_redirect

      blog = @community.blogs.find_by_uri! attrs[:uri]
      blog.should be
    end
  end

  describe "DELETE 'destroy'" do
    it "should be successful" do
      delete :destroy, :id => @blog.to_param
      response.should be_redirect

      @community.blogs.exists?(@blog.id).should_not be
    end
  end

end
