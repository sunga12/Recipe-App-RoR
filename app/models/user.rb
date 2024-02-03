class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  :confirmable

  # Associations
  has_many :foods, foreign_key: :user_id, dependent: :destroy
  has_many :recipes, foreign_key: :user_id, dependent: :destroy

  # Attributes
  attribute :name, :string

  # Validations
  validates :name, presence: true, length: { maximum: 250 }

  def generate_shopping_list
    hash = { shoping_list: {} }
    recipes.each do |r|
      r.recipe_foods.includes(:food).each do |i|
        item = i.food_id
        if hash[:shoping_list][item]
          hash[:shoping_list][item][:quantity] += i.quantity
        else
          i.quantity > i.food.quantity && hash[:shoping_list][item] = {
            name: i.food.name,
            available: i.food.quantity,
            quantity: i.quantity,
            price: i.food.price,
            unit: i.food.measurement_unit
          }
        end
      end
    end
    calculate_totals(hash)
  end

  private

  def calculate_totals(hash)
    items = 0
    cost = 0

    hash[:shoping_list].each do |_, i|
      if i[:quantity] > i[:available]
        items += i[:quantity] - i[:available]
        cost += (i[:quantity] - i[:available]) * i[:price]
      end
    end
    hash[:totals] = [items, cost]
    hash
  end
end
