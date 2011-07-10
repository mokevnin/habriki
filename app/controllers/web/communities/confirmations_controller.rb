class Web::Communities::ConfirmationsController < Web::Communities::ApplicationController
  def show
    @member = community.members.find_by_confirmation_token!(params[:confirmation_token])

    if @member.enable
      flash[:notice] = 'Confirmed'
      sign_in(:community_member, @member)
      redirect_to :root
    end
  end
end

