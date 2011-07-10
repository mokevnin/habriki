class Web::Communities::RegistrationsController < Web::Communities::ApplicationController
  include Devise::Controllers::InternalHelpers

  def new
    @member = community.members.build
  end

  def create
    @member = community.members.build(params[:community_member])
    if @member.save
      flash[:notice] = 'confirmation'
      CommunityMemberMailer.confirmation_instructions(@member).deliver
      redirect_to :root
    else
      clean_up_passwords(@member)
      render :action => :new
    end
  end

end

