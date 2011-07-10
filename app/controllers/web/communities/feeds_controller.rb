class Web::Communities::FeedsController < Web::Communities::ApplicationController
  layout false

  def index
    @posts = community.published_posts.limit(10)
    respond_to do |format|
      format.rss
    end
  end
end
