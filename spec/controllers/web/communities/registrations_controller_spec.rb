require 'spec_helper.rb'

describe Web::Communities::RegistrationsController do
  render_views

  before do
    request.env["devise.mapping"] = Devise.mappings[:community_member]

    @community = Factory :active_community
    request.host = @community.hostname
  end

  describe "GET 'new'" do
    it "should be success" do
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should be success" do
      attrs = Factory.attributes_for('community/member')

      post :create, :community_member => attrs
      response.should be_redirect

      member = @community.members.find_by_email(attrs[:email])
      member.should be
      member.state.should == 'waiting_email_confirm'
      member.login.should == attrs[:login]
    end
  end
end

