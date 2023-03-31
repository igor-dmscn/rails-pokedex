class CreatePokedexes < ActiveRecord::Migration[7.0]
  def change
    create_table :pokedexes do |t|
      t.belongs_to :trainer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
