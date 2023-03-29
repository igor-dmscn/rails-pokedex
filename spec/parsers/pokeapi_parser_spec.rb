require 'rails_helper'

RSpec.describe PokeapiParser do
  describe '#parse' do
    let(:pokemon_response) do
      VCR.use_cassette('pokeapi/pokemon') { Http::PokeapiClient.get('pokemon/charizard') }
    end

    it 'parses api response into Pokemon class' do
      parsed_pokemon = PokeapiParser.parse(body: pokemon_response.body)

      expect(parsed_pokemon.class).to eq(Pokemon)
    end

    it 'assigns the right variables' do
      parsed_pokemon = PokeapiParser.parse(body: pokemon_response.body)

      expect(parsed_pokemon.name).to eq('charizard')
    end
  end
end
