class Web::Account::CommunitiesController < Web::Account::ApplicationController
  def index
    @communities = current_user.communities
    title 'My communities'
  end

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

  def new
    @community = Community.new
  end

  def create
    @community = current_user.communities.build(params[:community])
    if @community.save
      flash[:notice] = 'Community was successfully created.'
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def destroy
    send :edit
    @community.destroy
    redirect_to :action => :index
  end
end
