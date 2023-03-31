module Pokemons
  class Create < ApplicationService

    attr_reader :pokemon_name, :trainer_id

    def initialize(pokemon_name:, trainer_id:)
      @pokemon_name = pokemon_name
      @trainer_id = trainer_id
    end

    def call
      result = Pokeapi::GetByName.call(pokemon_name:)

      if result.failure?
        return FailureResult.new(data: result.data)
      end

      pokemon = result.data
      pokemon.trainer_id = trainer_id

      if pokemon.save
        return SuccessResult.new(data: pokemon)
      else
        return FailureResult.new(data: { errors: pokemon.errors.full_messages })
      end
    end
  end
end
