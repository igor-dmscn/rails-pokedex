module Trainers
  class Create < ApplicationService
    attr_reader :name, :master_trainer_id

    def initialize(name:, master_trainer_id: nil)
      @name = name
      @master_trainer_id = master_trainer_id
    end

    def call
      trainer = Trainer.new(name:, master_trainer_id:)

      if trainer.save
        return SuccessResult.new(data: trainer)
      else
        return FailureResult.new(data: trainer.errors.full_messages)
      end
    end
  end
end
