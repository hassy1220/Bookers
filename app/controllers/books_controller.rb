class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:alert]="Book was successfully created."
      # 下の行では@をつけないといけないのは何故かupdateはつけてない
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render:index
    end
  end
  def show
    @book = Book.find(params[:id])
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:alerted]="Book was successfully updated."
       redirect_to book_path(@book.id)
    else
       render:edit
    end
  end
  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:alerts]="Book was successfully destroyed."
    end
    redirect_to"/books"
  end
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
