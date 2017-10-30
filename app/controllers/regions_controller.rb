class RegionsController < ApplicationController

  before_action :set_region, only: [:show, :edit, :update]

  def index
    @regions = Region.all
  end

  def show
    @countries = @region.countries
  end

  def edit
  end

  def update
    respond_to do |format|
      if @region.update(region_params)
        format.html { redirect_to @region, notice: 'Region was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
  def set_region
    @region = Region.find(params[:id])
  end

  def region_params
    params.require(:region).permit(:name, :map_graphic, :remove_map_graphic)
  end

end
