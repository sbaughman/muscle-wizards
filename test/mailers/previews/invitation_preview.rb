class InvitationPreview < ActionMailer::Preview

  def invite
    InvitationMailer.invite(User.last, Prep.first)
  end

  def accept
    InvitationMailer.accept(User.last, Prep.first)
  end

  def reject
    InvitationMailer.reject(User.last, Prep.first)
  end

end
