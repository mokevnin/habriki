class Feeds::Communities::PostsController < ApplicationController
  respond_to :rss
  helper_method :community

  def index
    @posts = community.published_posts.includes(:blog).limit(10)
    respond_with @posts
  end

  private

  def community
    @community ||= Community.active.find_by_uri! request.subdomain
  end

end
