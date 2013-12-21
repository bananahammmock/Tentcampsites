class ParksController < ApplicationController
	def show
		@park = Park.find_by_slug(params[:park_slug])
		
	end
	def new
		@park = Park.new
		@region = Region.find_by_slug(params[:region])
		@region_id = Region.find_by_slug(params[:region]).id
	end
	def create
    @park = Park.new(park_params)
    if @park.save
    	@region = @park.region
      redirect_to "/#{@region.state.slug}/#{@park.region.slug}"
    else
      render :new
    end
  end
private
	def park_params
		params.require(:park).permit(:name, :description, :region_id, :slug)
	end
end