class ApplicationController < ActionController::Base
  #FIXME protect_from_forgery

  include SubdomainHelper
  helper_method :subdomain, :url_for
end
