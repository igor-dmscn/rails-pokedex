module Pokedexes
  class Create < ApplicationService
    attr_reader :trainer_id

    def initialize(trainer_id:)
      @trainer_id = trainer_id
    end

    def call
      pokedex = Pokedex.new(trainer_id:)

      if pokedex.save
        return SuccessResult.new(data: pokedex)
      else
        return FailureResult.new(data: pokedex.errors.full_messages)
      end
    end
  end
end
