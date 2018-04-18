class SessionsController < ApplicationController

  def new
	end

	def create
    user = User.find_by_email(login_params[:email])
    puts user.email
		if user && user.password == login_params[:password]
		  session[:current_user_id] = user.id
      flash[:notice] = "You are now logged in!"
      redirect_to user_url(session[:current_user_id])
    else

      flash[:notice] = "Couldn't log in"
      redirect_to root_url
    end
	end

	def destroy
		@_current_user = session[:current_user_id] = nil
    flash[:notice] = "You have logged out."
    redirect_to root_url
  end

  def login_params
    params.require(:session).permit(:email, :password)
  end

end
