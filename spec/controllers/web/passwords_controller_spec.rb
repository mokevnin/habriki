require 'spec_helper'

describe Web::PasswordsController do
  render_views

  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get :edit
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    before do
      @user = Factory :active_user
      @user.send :generate_reset_password_token!
      @params = {
        :password => '123456',
        :password_confirmation => '123456',
        :reset_password_token => @user.reset_password_token
      }
    end
    it "should be successful" do
      put :update, :user => @params
      response.should be_redirect
    end
  end
end

