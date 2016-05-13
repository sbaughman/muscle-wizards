class CertificationsController < ApplicationController
  before_action :require_user

  def new
    @certification = Certification.new
  end

  def create
    @certification = Certification.new(certification_params)
    @certification.user = current_user
    if @certification.save
      flash[:success] = "New certification saved!"
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @certification = Certification.find(params[:id])
  end

  def update
    @certification = Certification.find(params[:id])
    if @certification.user == current_user && @certification.update_attributes(certification_params)
      flash[:success] = "Certification successfully updated!"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @certification = Certification.find(params[:id])
    @certification.destroy if @certification.user == current_user
    redirect_to user_path(current_user)
  end

  private

  def certification_params
    params.require(:certification).permit(:name, :date_granted)
  end

end
