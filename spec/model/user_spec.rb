require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject { User.create(name: 'admin', email: 'mcjthiongo@gmail.com', password: '123456') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
