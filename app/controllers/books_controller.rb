class BooksController < ApplicationController
    before_action :correct_user, only: [:edit, :update]

def top
end

def about
end

def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
	if @book.save
	redirect_to book_path(@book.id), notice:'create book successfully'
    else
        @user = User.find(current_user.id)
        @books = Book.all
        render "index"
        @book = Book.new
    end
end

def show
    @book = Book.find(params[:id])
	@user = User.find(@book.user_id)
    @book1 = Book.new
end

def index
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
end

def edit
    @book = Book.find(params[:id])
end

def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
    redirect_to book_path(@book.id), notice:'update book successfully'
   else
     render "edit"
   end
end

def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
end

private
	def book_params
	  params.require(:book).permit(:title, :body)
	end

    def correct_user
        book = Book.find(params[:id])
        if current_user.id != book.user.id
            redirect_to books_path
        end
    end
end