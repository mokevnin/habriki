class CommunityMemberMailer < ActionMailer::Base
  def confirmation_instructions(community, member)
    @community = community
    @member = member
    mail(:to => member.email,
         :subject => "Registration confirm")
  end
end
