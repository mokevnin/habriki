class CommunityMemberMailer < ActionMailer::Base
default :from => "habriki.com <info@habriki.com>",
          'Content-Transfer-Encoding' => '7bit'

  def confirmation_instructions(community, member)
    @member = member
    mail(:to => member.email,
         :subject => "Registration confirmation")
  end
end
