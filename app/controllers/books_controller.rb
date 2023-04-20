class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @book_detail = Book.find(params[:id])
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to home_about_path
  end

  def destroy
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
