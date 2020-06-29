class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
  end
  
  def create
    @book = Book.create(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to books_path
    else
      @books = Book.all
      render :index
    end
  end

  def show
  end

  def edit
  end
  
  def update
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."  
      redirect_to books_path
    else
      render :edit
    end
  end
  
  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :opinion).merge(user_id: current_user.id)
  end
end
