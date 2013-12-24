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

  # GET /campsites/1/edit
  def edit
  end

  # POST /campsites
  # POST /campsites.json
  def create
    @campsite = Campsite.new(campsite_params)
    if current_user == "bananahammock2@gmail.com"
      if @campsite.save
        if params[:park]
          @park = @campsite.park
          @region = @park.region
          redirect_to "/#{@region.state.slug}/#{@region.slug}/#{@park.slug}/#{@campsite.slug}"
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

  def update
    respond_to do |format|
      if @campsite.update(campsite_params)
        format.html { redirect_to @campsite, notice: 'Campsite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @campsite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campsites/1
  # DELETE /campsites/1.json
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
