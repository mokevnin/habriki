class Web::Communities::Members::CommentsController < Web::Communities::Members::ApplicationController
  
  def index
    @comments = member.comments.paginate :page => params[:page]
    title 'Comments'
  end

end


