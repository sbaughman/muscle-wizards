class InvitationMailer < ApplicationMailer
  default from: 'support@musclewizards.com'

  def invite(recipient, prep)
    @coach = recipient
    @prep = prep
    mail(to: @coach.email)
  end
end
