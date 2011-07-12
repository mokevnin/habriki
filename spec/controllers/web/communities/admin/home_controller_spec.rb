require 'spec_helper'

describe Web::Communities::Admin::HomeController do
  render_views

  before do
    @community = Factory :active_community
    @user = @community.user

    @params = {:community_id => @community.to_param}

    sign_in @user
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index, @params
      response.should be_success
    end
  end

end




