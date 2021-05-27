class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists and the password entered is correct
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when the navigate around the website
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
