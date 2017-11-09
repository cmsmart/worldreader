class ReadsController < ApplicationController

    respond_to :js
    
    def read
        @user = current_user
        @book = Book.find(params[:book_id])
        @user.read!(@book)
    end
    
    def unread
        @user = current_user
        @read = @user.reads.find_by_book_id(params[:book_id])
        @book = Book.find(params[:book_id])
        @read.destroy!
    end
    
end
