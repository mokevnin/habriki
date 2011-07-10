class Web::Communities::HomeController < Web::Communities::ApplicationController
  def index
    CommunityMemberMailer.confirmation_instructions(community.members.last).deliver
    @posts = community.posts
  end
end

