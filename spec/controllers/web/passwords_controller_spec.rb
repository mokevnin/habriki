require 'spec_helper'

describe Web::PasswordsController do

  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

end

