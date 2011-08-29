require 'spec_helper'

describe Web::Communities::Admin::HomeController do
  render_views

  before do
    @community = Factory :active_community
    @user = @community.user

    request.host = @community.hostname

    sign_in @user
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end

end

