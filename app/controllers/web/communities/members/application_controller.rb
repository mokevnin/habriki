class Web::Communities::Members::ApplicationController < Web::Communities::ApplicationController
  layout 'community/member'
  helper_method :member

  private

  def member
    @_member ||= community.members.find_by_login!(params[:member_id] || params[:id])
  end
end
