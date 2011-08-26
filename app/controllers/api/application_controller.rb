class Api::ApplicationController < ApplicationController
  before_filter :authenticate_community_member!

  respond_to :json
end
