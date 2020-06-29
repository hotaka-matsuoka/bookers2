class UsersController < ApplicationController
    before_action :authenticate_user!

  def index
    @users = User.all  
    @book = Book.new    
  end

  def show
    @books = Book.where(params[:user_id])
    @book = Book.find_by(params[:id])
    @user = User.find(params[:id])
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
