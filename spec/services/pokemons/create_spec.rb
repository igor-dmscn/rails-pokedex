require 'rails_helper'

RSpec.describe Pokemons::Create do
  describe '#call', :vcr do
    context 'when pokemon exists' do
      let(:pokemon_name) { 'charizard' }
      let(:trainer) { create(:trainer) }

      it 'returns success result' do
        result = described_class.call(pokemon_name:, trainer_id: trainer.id)

        expect(result.success?).to eq(true)
      end

      it 'returns the right name' do
        result = described_class.call(pokemon_name:, trainer_id: trainer.id)
        pokemon = result.data

        expect(pokemon.name).to eq(pokemon_name)
      end
    end

    context 'when pokemon does not exists' do
      let(:pokemon_name) { 'cleyton' }
      let(:trainer) { create(:trainer) }

      it 'returns failure result' do
        result = described_class.call(pokemon_name:, trainer_id: trainer.id)

        expect(result.failure?).to eq(true)
      end

      it 'returns data as not found' do
        result = described_class.call(pokemon_name:, trainer_id: trainer.id)

        expect(result.data).to eq('Not Found')
      end
    end
  end
end
