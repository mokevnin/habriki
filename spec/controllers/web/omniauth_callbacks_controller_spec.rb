require 'spec_helper'

describe Web::OmniauthCallbacksController do
  render_views

  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
    @omniauth = {
      'provider' => 'google',
      'uid' => 'uid',
      'user_info' => {
        'email' => Factory.next(:email),
        'first_name' => Factory.next(:name),
        'last_name' => Factory.next(:name)
      }
    }
    @request.env['omniauth.auth'] = @omniauth
  end

  describe "GET 'google'" do
    it "should be sign_in new user" do
      get :google
      response.should be_redirect

      user = User.find_by_email(@omniauth['user_info']['email'])
      user.should be
      user.first_name.should == @omniauth['user_info']['first_name']
      auth = user.authentications.first
      auth.uid.should == @omniauth['uid']
      auth.provider.should == @omniauth['provider']
    end
  end

end

