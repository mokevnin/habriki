class Web::Communities::Admin::CommunitiesController < Web::Communities::Admin::ApplicationController
  def edit
    @community = current_user.communities.find_by_uri!(params[:id])

    title 'Community edit'
  end

  def update
    send :edit
    if @community.update_attributes(params[:community])
      flash[:notice] = 'Community was successfully updated.'
      redirect_to :action => :edit
    else
      render :action => :edit
    end
  end
end

