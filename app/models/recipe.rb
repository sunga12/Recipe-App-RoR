class Recipe < ApplicationRecord
  has_many :recipe_foods, foreign_key: :recipe_id
  belongs_to :user, class_name: 'User', foreign_key: :user_id

  attribute :name, :string
  attribute :preparation_time, :string
  attribute :cooking_time, :string
  attribute :description, :text
  attribute :public, :boolean


  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true

end
