require 'spec_helper'

describe Web::HomeController do

  before do
    community = Factory :active_community
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end

end
