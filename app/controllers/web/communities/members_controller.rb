class Web::Communities::MembersController < Web::Communities::ApplicationController

  def index
    @members = community.members.page params[:page]
  end

end
