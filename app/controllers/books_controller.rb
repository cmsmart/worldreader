class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]



  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show

    # Goodreads API
      api_key = ENV.fetch('GOODREADS_KEY')

      # Goodreads API call requires all ASCII characters
      author_name = @book.author.name.encode('ASCII', :replace => "")
      book_name = @book.title.encode('ASCII', :replace => "")

      # api call
      response = HTTParty.get("https://www.goodreads.com/book/title.xml?author=#{author_name}&key=#{api_key}&title=#{book_name}")
      
      # parse xml to json with httparty and extract required results
      data = response.parsed_response
      @no_result = data['error']
      if @no_result != "Page not found"
        @description = data['GoodreadsResponse']['book']['description']
        @average_rating = data['GoodreadsResponse']['book']['average_rating']
        @ratings_count = data['GoodreadsResponse']['book']['work']['ratings_count']
        @goodreads_link = data['GoodreadsResponse']['book']['url']
      end

  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :cover_image, :summary, :published_year, :original_language, :author_id, :remove_cover_image)
    end
end
