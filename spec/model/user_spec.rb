require 'rails_helper'

RSpec.describe Recipe, type: :model do

  subject { User.new(name: 'Harry')}

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

end