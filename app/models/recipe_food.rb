class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  attribute :quantity, :integer

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1, only_integer: true }
end
