class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index 
    @attractions = Attraction.all
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def create 
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end
  def show
    @ride = Ride.new
    @user = current_user
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
  end

end
