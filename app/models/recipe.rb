class Recipe < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :recipe_foods, foreign_key: :recipe_id, dependent: :destroy

  # Attributes
  attribute :name, :string
  attribute :preparation_time, :string
  attribute :cooking_time, :string
  attribute :description, :text
  attribute :public, :boolean

  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_time, presence: true, numericality: { greater_than_or_equal_to: 0, only_float: true }
  validates :cooking_time, presence: true, numericality: { greater_than_or_equal_to: 0, only_float: true }
  validates :public, inclusion: [true, false]
end
