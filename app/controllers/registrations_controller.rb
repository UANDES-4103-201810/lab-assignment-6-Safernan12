class RegistrationsController < ApplicationController

	def new
    @user = User.new
	end

	def create
		@user = User.new(registrations_params)
    if @user.save
      flash[:notice] = "You are now registered!"
      redirect_to root_url
    else
      flash[:notice] = "You haven't been registered, try again."
      redirect_to sign_in_url
    end
  end

  def registrations_params
    params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
  end

end
