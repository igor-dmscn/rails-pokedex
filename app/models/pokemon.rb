class Pokemon < ApplicationRecord
  validates :name, presence: true

  belongs_to :trainer
end
