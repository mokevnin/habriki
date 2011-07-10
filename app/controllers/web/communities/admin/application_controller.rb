class Web::Communities::Admin::ApplicationController < Web::Communities::ApplicationController
  before_filter :authenticate_user!
  layout 'community/admin'
end
