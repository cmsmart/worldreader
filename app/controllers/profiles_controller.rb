class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :my_book, :my_country, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]


  def index
    @profiles = Profile.all
  end
 
  def show
    redirect_to edit_profile_url if @profile.nil?
  end

  def my_book
    redirect_to edit_profile_url if @profile.nil?
    # retreive data from users input
    @favourites = current_user.favourite_books
    @reads = current_user.reads
    @reading_list = current_user.reading_lists
  end

  def my_country
    redirect_to edit_profile_path if @profile.nil?

    # get all books read by a user
    @my_countries = current_user.reads

    # create an array of countries from books read
    @read_countries = []
    @my_countries.each do |read|
      @read_countries << read.book.author.country
    end

    # map countries to book count
    @countries = Hash[@read_countries.uniq.map{ |i| [i, @read_countries.count(i)] }]

    # get all countries available
    @all_countries = Country.all

    # create an array of countries that user has not read
    @unread_countries = @all_countries - @read_countries.uniq

  end

  # GET /profiles/new
  def new
    if current_user.profile.nil? || current_user.admin?
      @profile = Profile.new
    else
      redirect_to profiles_path(@profile)
    end 
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.new(user: current_user) if @profile.nil?
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update  
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to root, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_profile
      if params[:id]
        @profile = Profile.find(params[:id])
      else
        @profile = Profile.find_by(user: current_user)
      end
      # @profile = Profile.find(params[:id])
      authorize @profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :country_id, :avatar, :remove_avatar)
    end
end
