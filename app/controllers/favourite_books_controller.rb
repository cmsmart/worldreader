class FavouriteBooksController < ApplicationController

    respond_to :js
    
    def favourite_book
        @user = current_user
        @book = Book.find(params[:book_id])
        @user.favourite_book!(@book)
    end
    
    def unfavourite_book
        @user = current_user
        @favourite_book = @user.favourite_books.find_by_book_id(params[:book_id])
        @book = Book.find(params[:book_id])
        @favourite_book.destroy!
    end
end
