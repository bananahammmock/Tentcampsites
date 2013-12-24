class RegionsController < ApplicationController
  before_action :require_login, only: [:new]
  # skip_before_action :require_login, only: [:show]
 # before_action :set_region, only: [:show, :edit, :update, :destroy]

  # GET /regions
  # GET /regions.json
  def index
    @regions = Region.all
    
  end

  # GET /regions/1
  # GET /regions/1.json
  def show
    @region = Region.find_by_slug(params[:region_slug])
  end

  # GET /regions/new
  def new
    @region = Region.new
    @state_id = State.find_by_slug(params[:state]).id
  end

  # GET /regions/1/edit
  def edit
    @region = Region.find(params[:id])
  end

  # PATCH/PUT /regions/1
  # PATCH/PUT /regions/1.json
  def update
    @region = Region.find(params[:id])
    @region.update(region_params)
 
    if @region.save
      redirect_to "/#{@region.state.slug}/#{@region.slug}"
    end

  end


  # POST /regions
  # POST /regions.json
  def create
    @region = Region.new(region_params)
    if "a" == "a"
      if @region.save
        redirect_to "/#{@region.state.slug}"
      end
    else
      redirect_to root_path
      flash[:alert] = "You are not authorized to do that, BRO."
    end
  end


  # DELETE /regions/1
  # DELETE /regions/1.json
  def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
   # def set_region
  #    @region = Region.find(params[:id])
  #  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def region_params
      params.require(:region).permit(:name, :description, :state_id, :slug)
    end
end
