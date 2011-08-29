require 'spec_helper'

describe Web::Communities::Members::MembersController do
  render_views

  before do
    @member = Factory :active_community_member
    sign_in @member
    @params = {:id => @member.to_param}
    request.host = @member.community.hostname
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :show, @params
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get :edit, @params
      response.should be_success
    end
  end

  describe "PUT 'update'" do
    it "should be successful" do
      attrs = Factory.attributes_for('community/member')
      put :update, @params.merge!(:community_member => attrs)
      response.should be_redirect

      @member.reload
      @member.first_name.should == attrs[:first_name]
    end
  end
end



