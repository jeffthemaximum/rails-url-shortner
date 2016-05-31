class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    @user = User.find_by(email:email)
    if @user && @user.authenticate(password)
        # create new session
        log_in @user
        # remember of forget user based on checkbox
        params[:session][:remember] == '1' ? remember(@user) : forget(@user)
        # redirect to profile?
        redirect_to user_path(@user)
    else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
    end
  end

  def destroy
    if logged_in?
        log_out
        flash[:success] = 'successfully logged out!'
        redirect_to urls_path
    else
        flash[:success] = "You're not logged in, homie..."
        redirect_to urls_path
    end
  end
end
