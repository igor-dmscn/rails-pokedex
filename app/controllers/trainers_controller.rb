class TrainersController < ApplicationController
  before_action :set_trainer, only: [:show]
  def new
    @trainer = Trainer.new
  end

  def create
    name = trainer_params['name']
    master_trainer_id = trainer_params['master_trainer_id']
    
    result = Trainers::Create.call(name:, master_trainer_id:)

    if result.success?
      redirect_to trainer_path(result.data)
    else
      flash.now[:notice] = result.data
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @trainers = Trainer.all
  end

  def show
  end

  private

  def set_trainer
    @trainer = Trainer.find(params[:id])
  end
  
  def trainer_params
    params.require(:trainer).permit(:name, :master_trainer_id)
  end
end
