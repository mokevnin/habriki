class Web::Account::UsersController < Web::Account::ApplicationController
  def edit
    title 'Edit profile'
  end

  def update
    if current_user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to :action => :edit
    else
      send :edit
      render :action => "edit"
    end
  end
end
