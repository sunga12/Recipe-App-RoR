class User < ApplicationRecord
  has_many :foods, foreign_key: :user_id
  has_many :recipes, foreign_key: :user_id

  attribute :name, :string

  validates :name, presence: true

end