require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject do
    RecipeFood.new(quantity: 30,
    food_id: Food.new(name: 'Flour',
    measurement_unit: 'grams',
    price: 3,
    quantity: 30,
    user_id: User.create(name: 'Harry').id).id,
    recipe_id: Recipe.new(name: 'Lasagna',
    description: 'Mince, Cheese, Milk, seasoned, baked, italian',
    preparation_time: 1.5,
    cooking_time: 2.5,
    public: true,
    user_id: User.create(name: 'Harry').id).id)
  end

  before { subject.save }

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be a number' do
    subject.quantity = 'lovely food'
    expect(subject).to_not be_valid
  end
end
