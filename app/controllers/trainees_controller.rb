class TraineesController < ApplicationController
  # GET /trainees
  # GET /trainees.json
  def index
    @trainees = Trainee.all

    render json: @trainees
  end

  # GET /trainees/1
  # GET /trainees/1.json
  def show
    @trainee = Trainee.find(params[:id])

    render json: @trainee.as_json(only: [:trainer_id, :name, :height, :weight, :bio], 
                                  include: [:exercises, :foods])
  end

  # POST /trainees
  # POST /trainees.json
  def create
    @trainee = Trainee.new(trainee_params)

    if @trainee.save
      render json: @trainee, status: :created, location: @trainee
    else
      render json: @trainee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trainees/1
  # PATCH/PUT /trainees/1.json
  def update
    @trainee = Trainee.find(params[:id])

    if @trainee.update(trainee_params)
      head :no_content
    else
      render json: @trainee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trainees/1
  # DELETE /trainees/1.json
  def destroy
    @trainee = Trainee.find(params[:id])
    @trainee.destroy

    head :no_content
  end

  private
    
    def trainee_params
      params.require(:trainee).permit(:trainer_id, :name, :height, :weight, :bio)
    end
end
