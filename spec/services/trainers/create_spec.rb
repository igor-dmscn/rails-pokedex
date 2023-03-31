require 'rails_helper'

RSpec.describe Trainers::Create do
  describe '#call' do
    context 'with name attribute' do
      let(:trainer_name) { 'Trainer' }

      it 'returns success result' do
        result = described_class.call(name: trainer_name)

        expect(result.success?).to eq(true)
      end

      it 'creates the trainer with the right name' do
        result = described_class.call(name: trainer_name)
        trainer = result.data

        expect(trainer.name).to eq(trainer_name)
      end
    end

    context 'without name attribute' do
      let(:trainer_name) { nil }
      let(:expected_errors) { ["Name can't be blank"]}

      it 'returns failure result' do
        result = described_class.call(name: trainer_name)

        expect(result.failure?).to eq(true)
      end

      it 'returns error message' do
        result = described_class.call(name: trainer_name)

        expect(result.data).to eq(expected_errors)
      end
    end

    context 'with master trainer' do
      let(:trainer_name) { 'Trainer' }
      let(:master_trainer) { build(:trainer) }

      it 'returns success result' do
        result = described_class.call(name: trainer_name, master_trainer_id: master_trainer.id)

        expect(result.success?).to eq(true)
      end
      
      it 'sets the master trainer' do
        result = described_class.call(name: trainer_name, master_trainer_id: master_trainer.id)
        trainer = result.data

        expect(trainer.master_trainer_id).to eq(master_trainer.id)
      end
    end
  end
end
