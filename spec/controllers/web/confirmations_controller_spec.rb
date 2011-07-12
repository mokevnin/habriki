require 'spec_helper'

describe Web::ConfirmationsController do
  render_views

  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
    @user = Factory :user
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :show, :confirmation_token => @user.confirmation_token
      response.should be_redirect

      @user.reload
      @user.confirmed?.should be
      @user.active?.should be
    end
  end

end


