class Trainer < ApplicationRecord
  validates :name, presence: true

  belongs_to :master_trainer, class_name: 'Trainer', optional: true
  has_many :trainees, class_name: 'Trainer', inverse_of: :master_trainer, foreign_key: :master_trainer_id
  has_many :pokemons
end
