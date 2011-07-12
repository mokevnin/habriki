class Web::Communities::MembersController < Web::Communities::ApplicationController

  def index
    @members = community.members.paginate :page => params[:page]
  end

end
