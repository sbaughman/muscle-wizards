class CertificationsController < ApplicationController

  def new
    @certification = Certification.new
  end

  def create
    
  end

  def edit
    @certification = Certification.find(params[:id])
  end

  def update

  end

  private

  def certification_params

  end

end
