class Web::Communities::SearchesController < Web::Communities::ApplicationController
  def show
    @q = params[:q]
    search_params = {}
    search_params[:page] = params[:page]

    #TODO search history

    @posts = community.posts.search search_params

    title 'Search'
  end
end
