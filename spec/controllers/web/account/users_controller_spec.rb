require 'spec_helper'

describe Web::Account::UsersController do
  render_views

  before do
    @user = Factory :active_user
    sign_in @user
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get :edit
      response.should be_success
    end
  end

end
