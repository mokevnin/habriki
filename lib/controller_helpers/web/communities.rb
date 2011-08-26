module ControllerHelpers::Web::Communities

  def self.included(base)
    base.class_eval do
      layout 'community'
      helper_method :community
      include ControllerHelpers::Web
    end
  end

  private

  def community
    @_community ||= Community.active.find_by_uri! params[:community_id]
  end
end
