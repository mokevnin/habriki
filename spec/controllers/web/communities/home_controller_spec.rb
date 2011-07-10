require 'spec_helper'

describe Web::Communities::HomeController do
  before do
    @post = Factory 'community/post'

    @params = {:community_id => @post.community.to_param}
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index, @params
      response.should be_success
    end
  end

end
