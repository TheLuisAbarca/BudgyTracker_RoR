require 'rails_helper'

RSpec.describe "entities/show", type: :view do
  before(:each) do
    @entity = assign(:entity, Entity.create!(
      author: nil,
      name: "Name",
      amount: 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2.5/)
  end
end
