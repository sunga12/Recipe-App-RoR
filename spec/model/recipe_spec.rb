require 'rails_helper'

RSpec.describe Recipe, type: :model do

subject { Recipe.new(name: 'Lasagna', 
  description: 'Mince, Cheese, Milk, seasoned, baked, italian', 
  preparation_time: 1.5, 
  cooking_time: 2.5,
  public: true,
  user_id: User.create(name: 'Harry').id)}

before { subject.save }

it 'name should be present' do
  subject.name = nil
  expect(subject).to_not be_valid
end

it 'description should be present' do
  subject.description = nil
  expect(subject).to_not be_valid
end

it 'preparation time should be present' do
  subject.preparation_time = nil
  expect(subject).to_not be_valid
end

it 'preparation time should be a number' do
  subject.preparation_time = 'cheese'
  expect(subject).to_not be_valid
end

it 'cooking time should be present' do
  subject.cooking_time = nil
  expect(subject).to_not be_valid
end

it 'cooking time should be a number' do
  subject.cooking_time = 'lovely food'
  expect(subject).to_not be_valid
end

it 'public should be a present' do
  subject.public = nil
  expect(subject).to_not be_valid
end
end