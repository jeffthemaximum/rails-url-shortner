class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(new_user_params)
    if @user.valid?
        puts 'valid'
        redirect_to urls_path
    else
        puts 'invalid'
        render new_user_path
    end
  end

    def show
        @user = User.find(params[:id])
    end

  private
    def new_user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end
