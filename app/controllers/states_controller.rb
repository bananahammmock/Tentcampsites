class StatesController < ApplicationController
  before_action :require_login, only: [:new]
  # skip_before_action :require_login, only: [:show]
  # GET /states
  # GET /states.json
  def index
    @states = State.all
  end

  # GET /states/1
  # GET /states/1.json
  def show
    @state = State.find_by_slug(params[:state_slug])
  end

  # GET /states/new
  def new
    @state = State.new
  end

  def edit
   @state = State.find(params[:id])
  end
 
  def blargh
  end


  def create
    @state = State.new(state_params)
    if current_user.email == "bananahammock2@gmail.com"
      if @state.save
        redirect_to root_path
      else
        render :new
      end
    else
      redirect_to root_path
      flash[:alert] = "You are not authorized to do that, BRO."
    end
  end

  
  def update
    @state = State.find(params[:id])
    @state.update(state_params)
    if @state.save
      redirect_to "/#{@state.slug}/"
    end
  end

 
  def destroy
    @state.destroy
    respond_to do |format|
      format.html { redirect_to states_url }
      format.json { head :no_content }
    end
  end

  private
  def state_params
    params.require(:state).permit(:name, :description, :slug)
  end
    # Use callbacks to share common setup or constraints between actions.
#    def set_state
 #     @state = State.find(params[:id])
  #  end

    # Never trust parameters from the scary internet, only allow the white list through.
   # def state_params
    #  params.require(:state).permit(:name, :description)
    #end
end
