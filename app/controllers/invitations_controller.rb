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
      redirect_to prep_path(@prep)
    else
      render :new
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to prep_path(@prep)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:message)
  end
end
