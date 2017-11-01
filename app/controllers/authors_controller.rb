class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  

  # GET /authors
  # GET /authors.json
  def index
    @authors = Author.all
  end

  # GET /authors/1
  # GET /authors/1.json
  def show
    @books = @author.books

    # Goodreads API
    if @author.goodreads_id.present?
      api_key = ENV.fetch('GOODREADS_KEY')
      author_id = @author.goodreads_id
      response = HTTParty.get("https://www.goodreads.com/author/show/#{author_id}?format=xml&key=#{api_key}")
      data = response.parsed_response
      @no_result = data['error']
      if @no_result != 'author not found'
        @bio = data['GoodreadsResponse']['author']['about']
        @photo = data['GoodreadsResponse']['author']['large_image_url']
        @dob = data['GoodreadsResponse']['author']['born_at']
        @goodreads_link = data['GoodreadsResponse']['author']['link']
      end
    end

  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors
  # POST /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to @author, notice: 'Author was successfully created.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1
  # PATCH/PUT /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to @author, notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_url, notice: 'Author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:name, :country_id, :goodreads_id, :bio, :dob, :photo, :remove_photo)
    end
end
