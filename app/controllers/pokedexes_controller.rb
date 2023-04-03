class PokedexesController < ApplicationController
  before_action :set_pokedex, only: [:show]

  def index
    @pokedexes = Pokedex.all
  end

  def show
  end

  def new
    @pokedex = Pokedex.new
  end

  def create
    trainer_id = pokedex_params['trainer_id']
    result = Pokedexes::Create.call(trainer_id:)

    if result.success?
      redirect_to pokedex_path(result.data)
    else
      flash.now[:notice] = result.data
      render :new, status: :unprocessable_entity
    end
  end

  private 

  def set_pokedex
    @pokedex = Pokedex.find(params[:id])
  end

  def pokedex_params
    params.require(:pokedex).permit(:trainer_id)
  end
end
