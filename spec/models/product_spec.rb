require 'rails_helper'

RSpec.describe Product, :type => :model do
  subject {
    described_class.new(name: 'Apple')
  }
  it 'is invalid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end