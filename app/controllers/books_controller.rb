class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new(book_params)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
    @book = find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
