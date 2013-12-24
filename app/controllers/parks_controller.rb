class ParksController < ApplicationController
	before_action :require_login, only: [:new]
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
    if 'a' == 'a'
	    if @park.save
	    	@region = @park.region
	      redirect_to "/#{@region.state.slug}/#{@park.region.slug}"
	    else
	      render :new
	    end
	  else
	  	redirect_to root_path
      flash[:alert] = "You are not authorized to do that, BRO."
    end
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])
    @park.update(park_params)
 
    if @park.save
      redirect_to "/#{@park.region.state.slug}/#{@park.region.slug}/park/#{@park.slug}"
    end

	end

private
	def park_params
		params.require(:park).permit(:name, :description, :region_id, :slug)
	end
end