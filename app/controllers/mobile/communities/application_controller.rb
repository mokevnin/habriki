class Mobile::Communities::ApplicationController < ApplicationController
  layout 'community'

  before_filter do
    @community = Community.active.find_by_uri! params[:community_id]
  end
end
