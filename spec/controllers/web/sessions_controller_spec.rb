require 'spec_helper'

describe Web::SessionsController do
  render_views

  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "GET 'sign_in'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do
    before do
      @user = Factory :active_user, :password => '123456', :password_confirmation => '123456'
      @params = {:user => {:email => @user.email, :password => @user.password}}
    end
    it "should be successful" do
      post :create, @params
      response.should be_redirect
    end
  end
end


