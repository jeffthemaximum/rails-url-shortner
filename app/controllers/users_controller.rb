class UsersController < ApplicationController

  def create
    if request.post?
      @user = User.create(new_user_params)
        if @user.valid?
          flash[:success] = "You've signed up!"
          log_in(@user)
          remember(@user)
          redirect_to urls_path
      else
          render 'new'
      end
    else
      @user = User.new
      render 'new'
    end
  end

    def show
        @user = User.find(params[:id])
        @base_url = request.base_url
    end

  private
    def new_user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end
