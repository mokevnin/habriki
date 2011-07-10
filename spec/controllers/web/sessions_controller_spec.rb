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

end


