class InvitationPreview < ActionMailer::Preview

  def invite
    InvitationMailer.invite(User.last, Prep.first)
  end

end
