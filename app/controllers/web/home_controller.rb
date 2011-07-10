class Web::HomeController < Web::ApplicationController
  def index
    @communities = Community.active
  end

end
