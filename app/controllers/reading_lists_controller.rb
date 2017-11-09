class ReadingListsController < ApplicationController

    respond_to :js
    
    def reading_list
        @user = current_user
        @book = Book.find(params[:book_id])
        @user.reading_list!(@book)
    end
    
    def remove_reading_list
        @user = current_user
        @reading_list = @user.reading_lists.find_by_book_id(params[:book_id])
        @book = Book.find(params[:book_id])
        @reading_list.destroy!
    end


end
