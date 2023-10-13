class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  # Associations
  has_many :foods, foreign_key: :user_id, dependent: :destroy
  has_many :recipes, foreign_key: :user_id, dependent: :destroy

  # Attributes
  attribute :name, :string

  # Validations
  validates :name, presence: true, length: { maximum: 250 }

  def filtered_food_list
    list = []
    foods.each do |food|
      list << [food.name, food.id]
    end

    list
  end
end
