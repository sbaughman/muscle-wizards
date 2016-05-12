class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
    if params[:coach]
      render 'devise/registrations/new_coach'
    else
      render 'devise/registrations/new'
    end
  end

  def create
    super
  end

  def update
    super
  end
  
end
