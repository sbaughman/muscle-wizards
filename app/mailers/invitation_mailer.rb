class InvitationMailer < ApplicationMailer
  default from: 'support@musclewizards.com'

  def invite(recipient, prep)
    @coach = recipient
    @prep = prep
    mail(to: @coach.email,
         subject: 'Request for Coaching')
  end

  def accept(recipient, prep)
    @athlete = recipient
    @prep = prep
    mail(to: @athlete.email,
         subject: 'Coach Request Accepted!')
  end

  def reject(recipient, prep)
    @coach = recipient
    @prep = prep
    mail(to: @coach.email,
         subject: 'Coach Request Cancelled')
  end
end
