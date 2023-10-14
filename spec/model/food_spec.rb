require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    Food.new(name: 'Flour',
             measurement_unit: 'grams',
             price: 3,
             quantity: 30,
             user_id: User.create(name: 'Harry').id)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'measurement_unit should be present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'price should be present' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'price should be a number' do
    subject.price = 'cheese'
    expect(subject).to_not be_valid
  end

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be a number' do
    subject.quantity = 'lovely food'
    expect(subject).to_not be_valid
  end
end
