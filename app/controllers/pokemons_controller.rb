class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show]
  def index
    @pokemons = Pokemon.all
  end
  
  def show
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    pokemon_name = params['pokemon']['name']
    trainer_id = params['pokemon']['trainer_id']

    result = Pokemons::Create.call(pokemon_name:, trainer_id:)

    if result.success?
      redirect_to pokemon_path(result.data)
    else
      flash.now[:notice] = 'Error'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :trainer_id)
  end

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
