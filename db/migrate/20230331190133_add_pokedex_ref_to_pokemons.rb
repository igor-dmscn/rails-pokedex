class AddPokedexRefToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_reference :pokemons, :pokedex, null: false, foreign_key: true
  end
end
