class Web::Communities::Members::CommentsController < Web::Communities::Members::ApplicationController
  
  def index
    @comments = member.comments.page params[:page]
    title 'Comments'
  end

end


