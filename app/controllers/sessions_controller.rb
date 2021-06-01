class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      #success, log them in
      session[:user_id] = user.id
      redirect_to '/'
    else
      #fail, load login form
      redirect_to '/login'
    end
  end


  #   user = User.find_by_email(params[:email])
  #   # If the user exists and the password entered is correct
  #   if user && user.authenticate(params[:password])
  #     # Save the user id inside the browser cookie. This is how we keep the user
  #     # logged in when the navigate around the website
  #     session[:user_id] = user.id
  #     redirect_to '/'
  #   else
  #     redirect_to '/login'
  #   end
  # end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
