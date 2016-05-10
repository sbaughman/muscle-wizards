class InvitationsController < ApplicationController

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @prep = Prep.find(params[:prep_id])
    @invitation.user = User.find(params[:id])
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
    redirect_to prep_path(@invitation.prep)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:message)
  end
end
