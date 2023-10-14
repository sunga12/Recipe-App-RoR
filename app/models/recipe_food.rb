class RecipeFood < ApplicationRecord
  # Associations
  belongs_to :recipe
  belongs_to :food

  # Attributes
  attribute :quantity, :integer

  # Validations
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
