class WriterMailer < ActionMailer::Base
  default from: "jyotisinghdev1@gmail.com"

  def invite_confirmation(invitation)
    @invitation = invitation
    mail(:to => invitation.email,:subject => "Register for Complitech Program !!!")
  end

end
