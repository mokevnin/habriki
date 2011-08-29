class Web::Communities::Members::ApplicationController < Web::Communities::ApplicationController
  layout 'community/member'

  helper_method :member

  private

  def member
    @_member ||= community.members.find_by_login(params[:member_id] || params[:id])
  end

  def authenticate_community_member!
    super
    if member != current_community_member
      #TODO
      head 403
    end
  end
end
