class Pokemon < ApplicationRecord
  validates :name, presence: true

  belongs_to :trainer
  belongs_to :pokedex
end
