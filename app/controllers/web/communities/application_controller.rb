class Web::Communities::ApplicationController < Web::ApplicationController
  layout 'community'
  helper_method :community

  private

  def community
    @_community ||= Community.active.find_by_uri! params[:community_id]
  end
end
