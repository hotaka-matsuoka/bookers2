class UsersController < ApplicationController
    before_action :authenticate_user!

  def index
    @users = User.all  
    @book = Book.new   
    @user = current_user 
  end

  def show
    @book = Book.find_by(params[:id])
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully." 
      redirect_to books_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
