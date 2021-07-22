class BirdsController < ApplicationController

  # POST /birds
  def create
    # bird = Bird.create(name: params[:name], species: params[:species])
    # render json: bird, status: :created

    #PASSING IN ENTIRE PARAMS
    # bird = Bird.create(params)
    # render json: bird, status: :created

    #PASSING IN ENTIRE PARAMS WITH PROTECTIONS
    # bird = Bird.create(params.permit(:name, :species))
    # render json: bird, status: :created

    #passing in entire params as a private method
    bird = Bird.create(bird_params)
    render json: bird, only: [:name, :species], status: :created
  end

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  private
  # all methods below here are private

  def bird_params
    params.permit(:name, :species)
  end

end
