class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(books_params)
    if @book.save
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render "index"
    end
  end


  def edit
     @book = Book.find(params[:id])
  end

  def update
     book = Book.find(params[:id])
    book.update(books_params)
    redirect_to book_path(book.id)
  end

  def destroy
    list = Book.find(params[:id])
    list.destroy
    redirect_to books_path
  end



 private
  def books_params
    params.require(:book).permit(:title, :body)
  end

end
