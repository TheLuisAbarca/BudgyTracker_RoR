# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject { Entity.new(name: 'LendMoney', amount: 15) }
  before { subject.save }

  it 'name should be "LendMoney".' do
    expect(subject.name).to eq 'LendMoney'
  end

  it 'object should be "invalid".' do
    subject.name =  nil
    expect(subject).to_not be_valid
  end

  it 'object should be "invalid".' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
end
