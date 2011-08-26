class Web::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include ControllerHelpers::Web

  def google
    omniauth = request.env["omniauth.auth"]
    provider = omniauth['provider']
    uid      = omniauth['uid'].to_s
    info     = omniauth['user_info']

    authentication = User::Authentication.find_by_provider_and_uid(provider, uid)
    if authentication
      sign_in authentication.user, :event => :authentication
      return redirect_to(account_communities_path)
    end

    unless user = User.find_by_email(info['email'])
      user = User.new do |u|
        u.email = info['email']
        u.first_name = info['first_name']
        u.last_name = info['last_name']
        u.password = Devise.friendly_token
      end
    end
    user.authentications.build :uid => uid, :provider => provider

    if user.enable
      sign_in user
      #FIXME notify
      return redirect_to(account_communities_path)
    end

    #TODO handle errors
  end
end

