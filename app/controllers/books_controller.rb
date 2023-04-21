class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @book_detail = Book.find(params[:id])
    @user = User.find(@book_detail.user_id)
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])

    if current_user != @book.user
    redirect_to books_path
    end
  end

  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "your creation successfully completed!!"
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "your update successfully completed!!"
      redirect_to book_path
    else
      render :edit
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
