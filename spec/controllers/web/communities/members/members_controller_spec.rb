require 'spec_helper'

describe Web::Communities::Members::MembersController do
  render_views

  before do
    @member = Factory :active_community_member
    @params = {:community_id => @member.community.to_param, :id => @member.to_param}
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :show, @params
      response.should be_success
    end
  end

end



