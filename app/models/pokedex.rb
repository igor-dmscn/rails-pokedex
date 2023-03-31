class Pokedex < ApplicationRecord
  has_many :pokemons
  belongs_to :trainer
end
