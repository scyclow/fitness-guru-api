class ExercisesController < ApplicationController
  # GET /exercises
  # GET /exercises.json
  def index
    @exercises = Exercise.all

    render json: @exercises
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
    @exercise = Exercise.find(params[:id])

    render json: @exercise
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      render json: @exercise, status: :created, location: @exercise
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    @exercise = Exercise.find(params[:id])

    if @exercise.update(exercise_params)
      head :no_content
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy

    head :no_content
  end

  private
    
    def exercise_params
      params.require(:exercise).permit(:trainee_id, :name, :reps, :rep_weight, :sets)
    end
end
