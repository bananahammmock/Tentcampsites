class CampsitesController < ApplicationController
  before_action :require_login, only: [:new]
  # skip_before_action :require_login, only: [:show]

  # GET /campsites
  # GET /campsites.json
  def index
    @campsites = Campsite.all
  end

  # GET /campsites/1
  # GET /campsites/1.json
  def show
    @campsite = Campsite.find_by_slug(params[:campsite_slug])
  end

  # GET /campsites/new
  def new
    @campsite = Campsite.new
    if params[:park]
      @park = Park.find_by_slug(params[:park])
      @park_id = Park.find_by_slug(params[:park]).id
      @region = Region.find_by_slug(params[:region])
      @region_id = Region.find_by_slug(params[:region]).id
    else
      @region = Region.find_by_slug(params[:region])
      @region_id = Region.find_by_slug(params[:region]).id
    end
  end

  def create
  @campsite = Campsite.new(campsite_params)
  if 'a' == "a"
    if @campsite.save
      if params[:park]
        @park = @campsite.park
        @region = @park.region
        redirect_to "/#{@region.state.slug}/#{@region.slug}/park/#{@park.slug}/#{@campsite.slug}"
      else
        @region = @campsite.region
        redirect_to "/#{@region.state.slug}/#{@region.slug}/#{@campsite.slug}"
      end
    else
    end
  else
    redirect_to root_path
    flash[:alert] = "You are not authorized to do that, BRO."
  end

  end

  def edit
    @campsite = Campsite.find(params[:id])
  end

  def update
    @campsite = Campsite.find(params[:id])
    @campsite.update(campsite_params)
 
    if @campsite.save
      redirect_to "/#{@campsite.region.state.slug}/#{@campsite.region.slug}/#{@campsite.slug}"
    end

  end


  def destroy
    @campsite.destroy
    respond_to do |format|
      format.html { redirect_to campsites_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campsite
      @campsite = Campsite.find_by_slug(params[:campsite_slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campsite_params
      params.require(:campsite).permit(:name, :description, :park_id, :region_id, :slug)
    end
end
