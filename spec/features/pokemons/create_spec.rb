require 'rails_helper'

RSpec.describe 'Pokemons' do
  describe 'Create Pokemon', :vcr do
    context 'when pokemon exists' do

      it 'visits the create pokemon page' do
        visit '/pokemons/new'
        
        expect(page).to have_content('New pokemon')
      end
      
      it 'creates the pokemon' do
        visit '/pokemons/new'
        
        fill_in 'pokemon_name', with: 'charizard'
        click_button 'commit'

        expect(current_path).to_not eq(new_pokemon_path)
      end
    end

    context 'when pokemon does not exists' do
      it 'visits the create pokemon page' do
        visit '/pokemons/new'
        
        expect(page).to have_content('New pokemon')
      end
      
      it 'does not create the pokemon' do
        visit '/pokemons/new'
        
        fill_in 'pokemon_name', with: 'megazord'
        click_button 'commit'

        expect(page).to have_content('Error')
      end
    end
  end
end
