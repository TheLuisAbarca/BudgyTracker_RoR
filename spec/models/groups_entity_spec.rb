require 'rails_helper'

RSpec.describe GroupsEntity, type: :model do
  subject { GroupsEntity.new(group_id: Group.first.id, entity_id: Entity.first.id) }
  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'object should be invalid' do
    subject.group_id = nil
    expect(subject).to_not be_valid
  end

  it 'object should be invalid' do
    subject.entity_id = nil
    expect(subject).to_not be_valid
  end
end
