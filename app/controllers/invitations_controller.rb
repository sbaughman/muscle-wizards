class InvitationsController < ApplicationController
  before_action :set_prep

  def new
    @invitation = Invitation.new
    @coach = User.find(params[:id])
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @coach = User.find(params[:id])
    @invitation.user = @coach
    @invitation.prep = @prep
    if @invitation.save
      flash[:success] = "Invitation sent!"
      InvitationMailer.invite(@coach, @prep).deliver_later
      redirect_to prep_path(@prep)
    else
      render :new
    end
  end

  def show
    @invitation = @prep.invitation
    @user = @prep.user
    @coach = User.find(params[:id])
  end

  def destroy
    @invitation = Invitation.find_by(user_id: params[:id])
    @invitation.destroy
    redirect_to prep_path(@prep)
  end

  def accept_invite
    @invitation = @prep.invitation
    @coach = User.find(params[:id])
    @prep.coach_id = @coach.id
    @prep.save
    @invitation.destroy
    redirect_to @prep
  end

  private

  def invitation_params
    params.require(:invitation).permit(:message)
  end
end
