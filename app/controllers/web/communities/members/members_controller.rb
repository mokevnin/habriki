class Web::Communities::Members::MembersController < Web::Communities::Members::ApplicationController
  before_filter :authenticate_community_member!, :only => [:edit]
  
  def show
    title 'Profile'
  end

  def edit
  end

  def update
    if member.update_attributes(params[:community_member])
      flash[:notice] = 'Member was successfully updated.'
      redirect_to :action => :edit
    else
      render :action => "edit"
    end
  end

end

