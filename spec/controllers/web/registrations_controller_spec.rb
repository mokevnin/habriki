require 'spec_helper'

describe Web::RegistrationsController do
  render_views

  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "GET 'sign_up'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should be successful" do
      attrs = Factory.attributes_for(:user)
      post :create, :user => attrs
      response.should be_redirect
      user = User.find_by_email attrs[:email]
      user.should be
    end
  end

end

