class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
