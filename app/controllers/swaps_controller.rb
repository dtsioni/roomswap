class SwapsController < ApplicationController
  before_action :set_swap, only: [:show, :destroy, :update, :edit]
  before_action :set_user, only: [:create, :update]

  def show

  end

  def new
    @swap = Swap.new
    @origin = Location.new
    @swap.origin = @origin
    1.times{ @swap.destinations.build }
  end

  def index
    @swaps = Swap.all
  end

  def create
    @swap = Swap.new(swap_params)
    @swap.user = current_user
    respond_to do |format|
      if @swap.save
        format.html{ redirect_to user_path(current_user) }
        flash[:success] = "Your swap was successfully created!"
      else
        format.html{ render :new }
        flash.now[:error] = "Your swap was not created."
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @swap.update(swap_params)
        format.html{ redirect_to user_path(current_user) }
        flash[:success] = "Your swap was successfully updated!"
      else
        format.html{ render :edit }
      end
    end
  end

  def destroy
    @swap.destroy
    respond_to do |format|
      format.html{ redirect_to root_path }
      flash[:success] = "Your swap was successfully deleted."
    end
  end

  private

    def set_swap
      @swap = Swap.find(params[:id])
    end

    def set_user
      current_user
    end

    def swap_params
      params.require(:swap).permit(origin_attributes: [:campus, :building, :floor, :university_id],
        destinations_attributes: [:campus, :building, :floor, :university_id])
    end
end