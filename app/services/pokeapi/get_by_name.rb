module Pokeapi
  class GetByName < ApplicationService

    attr_reader :pokemon_name

    def initialize(pokemon_name:)
      @pokemon_name = pokemon_name
    end

    def call
      endpoint = "pokemon/#{pokemon_name}"
      response = Http::PokeapiClient.get(endpoint)

      status = response.status
      body = response.body

      return FailureResult.new(data: body) if status == 404
      
      parsed_pokemon = PokeapiParser.parse(body:)

      SuccessResult.new(data: parsed_pokemon)
    end
  end
end
