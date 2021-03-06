class SessionController < ApplicationController
  def new; end

  def create
    @user = User.find_by_name(params[:name])
    # If the user exists
    if @user
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Login Successfully.'
    # If user's login doesn't work, send them back to the login form.
    else
      redirect_to '/login', notice: 'Sorry, the username is incorrect.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: "Goodbye! You're now logged out!"
  end
end
