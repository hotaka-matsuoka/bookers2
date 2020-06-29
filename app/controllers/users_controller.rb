class UsersController < ApplicationController
    before_action :authenticate_user!
  def show
    @book = User.find_by(params[:user_id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
