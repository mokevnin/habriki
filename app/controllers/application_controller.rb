class ApplicationController < ActionController::Base
  #FIXME protect_from_forgery

  include SubdomainHelper
  #TODO
  before_filter :set_mailer_url_options
end
