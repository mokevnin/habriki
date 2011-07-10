class CommunityMemberMailer < ActionMailer::Base
  def confirmation_instructions(member)
    @member = member
    mail(:to => member.email,
         :subject => "Registration confirm")
  end
end
