require 'rails_helper'

RSpec.describe Pokemon do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'associations' do
    it { should belong_to :trainer }
  end
end
