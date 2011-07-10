class Web::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include ControllerHelpers::Web

  def google
    omniauth = request.env["omniauth.auth"]
    provider = omniauth['provider']
    uid      = omniauth['uid'].to_s

    authentication = User::Authentication.find_by_provider_and_uid(provider, uid)
    if authentication
      sign_in authentication.user
      return redirect_to account_communities_path
    end

    user = User.find_or_initialize_by_email(omniauth['user_info']['email'])
    unless user.persisted?
      user.first_name = omniauth['user_info']['first_name']
      user.last_name  = omniauth['user_info']['last_name']
      user.password   = Devise.friendly_token
    end
    user.authentications.build :uid => uid, :provider => provider

    if user.enable
      sign_in user
      #FIXME notify
      return redirect_to account_communities_path
    end
  end
end

