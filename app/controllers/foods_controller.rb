class FoodsController < ApplicationController
  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.all

    render json: @foods
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
    @food = Food.find(params[:id])

    render json: @food
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)

    if @food.save
      render json: @food, status: :created, location: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    @food = Food.find(params[:id])

    if @food.update(food_params)
      head :no_content
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    head :no_content
  end

  private
    
    def food_params
      params.require(:food).permit(:name, :calories)
    end
end
