class TrainersController < ApplicationController
  # GET /trainers
  # GET /trainers.json
  def index
    @trainers = Trainer.all

    render json: @trainers
  end

  # GET /trainers/1
  # GET /trainers/1.json
  def show
    @trainer = Trainer.find(params[:id])

    render json: @trainer.as_json(only: [:name], include: [:trainees])
  end

  # POST /trainers
  # POST /trainers.json
  def create
    p'*'*800
    p params

    @trainer = Trainer.new(trainer_params)

    p @trainer

    if @trainer.save
      render json: @trainer, status: :created, location: @trainer
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trainers/1
  # PATCH/PUT /trainers/1.json
  def update
    @trainer = Trainer.find(params[:id])

    if @trainer.update(trainer_params)
      head :no_content
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trainers/1
  # DELETE /trainers/1.json
  def destroy
    @trainer = Trainer.find(params[:id])
    @trainer.destroy

    head :no_content
  end

  private
    
    def trainer_params
      params.require(:trainer).permit(:name)
    end
end
