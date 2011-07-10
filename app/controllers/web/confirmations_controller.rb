class Web::ConfirmationsController < Devise::ConfirmationsController
  include ControllerHelpers::Web

  def show
    @user = User.find_by_confirmation_token!(params[:confirmation_token])

    if @user.enable
      flash[:notice] = 'Confirmed'
      sign_in(:user, @user)
      redirect_to account_communities_path
    else
      redirect_to :root
    end
  end
end

