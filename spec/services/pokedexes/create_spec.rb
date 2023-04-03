require 'rails_helper'

RSpec.describe Pokedexes::Create do
  describe '#call' do
    context 'with trainer_id attribute' do
      let(:trainer) { create(:trainer) }

      it 'returns success result' do
        result = described_class.call(trainer_id: trainer.id)

        expect(result.success?).to eq(true)
      end

      it 'creates the pokedex with the right trainer' do
        result = described_class.call(trainer_id: trainer.id)
        pokedex = result.data

        expect(pokedex.trainer_id).to eq(trainer.id)
      end
    end

    context 'without trainer_id attribute' do
      let(:expected_errors) { ["Trainer must exist"]}

      it 'returns failure result' do
        result = described_class.call(trainer_id: nil)

        expect(result.failure?).to eq(true)
      end

      it 'returns error message' do
        result = described_class.call(trainer_id: nil)

        expect(result.data).to eq(expected_errors)
      end
    end
  end
end
