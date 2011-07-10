class UserMailer < ActionMailer::Base
  default :from => configatron.host

  def create(user)
    @user = user
    mail(:to => user.email,
         :subject => "Welcome to Awesome Site")
  end
end
