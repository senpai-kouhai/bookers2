class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
  end

  def update
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end


end
