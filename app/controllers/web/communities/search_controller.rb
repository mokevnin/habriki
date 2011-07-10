class Web::Communities::SearchController < Web::Communities::ApplicationController
  def index
    @q = params[:q]
    search_params = {}
    search_params[:page] = params[:page]

    #TODO search history

    @posts = community.posts.search search_params

    title 'Поиск'
  end
end
