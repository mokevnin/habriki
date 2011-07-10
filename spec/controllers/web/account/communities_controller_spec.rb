require 'spec_helper'

describe Web::Account::CommunitiesController do
  render_views

  before do
    @community = Factory :active_community
    @user = @community.user
    sign_in @user

    @params = {:id => @community.to_param}
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
    it "should be redirect" do
      attrs = Factory.attributes_for :community
      post :create, :community => attrs
      response.should be_redirect

      community = Community.find_by_uri attrs[:uri]
      community.should be
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get :edit, @params
      response.should be_success
    end
  end

  describe "PUT 'update'" do
    it "should be successful" do
      attrs = Factory.attributes_for :community
      post :update, @params.merge!(:community => attrs)
      response.should be_redirect

      community = Community.find_by_uri attrs[:uri]
      community.should be
    end
  end

  describe "DELETE 'destroy'" do
    it 'should be successful' do
      delete :destroy, @params
      response.should be_redirect

      Community.exists?(@community.id).should_not be
    end
  end
end
