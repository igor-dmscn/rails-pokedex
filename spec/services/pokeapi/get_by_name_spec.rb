require 'rails_helper'

RSpec.describe Pokeapi::GetByName do
  describe '#call', :vcr do
    context 'when pokemon exists' do
      let(:pokemon_name) { 'charizard' }

      it 'returns success result' do
        result = described_class.call(pokemon_name:)

        expect(result.success?).to eq(true)
      end

      it 'returns the right name' do
        result = described_class.call(pokemon_name:)
        data = result.data

        expect(data.name).to eq(pokemon_name)
      end
    end

    context 'when pokemon does not exists' do
      let(:pokemon_name) { 'cleyton' }

      it 'returns failure result' do
        result = described_class.call(pokemon_name:)

        expect(result.failure?).to eq(true)
      end

      it 'returns data as not found' do
        result = described_class.call(pokemon_name:)

        expect(result.data).to eq('Not Found')
      end
    end
  end
end
