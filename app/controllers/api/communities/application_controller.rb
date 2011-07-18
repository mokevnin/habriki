class Api::Communities::ApplicationController < Api::ApplicationController
  private

  def community
    @_community ||= Community.active.find_by_uri! params[:community_id]
  end
end

