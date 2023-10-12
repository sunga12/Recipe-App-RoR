class RecipeFood < ApplicationRecord
  # Associations
  has_many :foods, class_name: 'Food', foreign_key: :food_id
  has_many :recipe, class_name: 'Recipe', foreign_key: :recipe_id

  # Attributes
  attribute :quantity, :integer

  # Validations
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
