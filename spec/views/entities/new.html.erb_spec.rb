require 'rails_helper'

RSpec.describe 'Entities', type: :feature do
  describe 'new' do
    before(:each) do
      @user = User.create!(name: 'Ashley', email: 'kabarca@gmail.com', password: '123456',
                           password_confirmation: '123456')
      @group1 = Group.create!(id:1, name: 'name1', icon: 'wwww.testicon.com', author_id: @user.id)
      @entity1 = @group1.entities.create(name: 'Extra Jobs', amount: 55, author_id: @user.id)
      visit new_user_session_path
      fill_in 'Email', with: 'kabarca@gmail.com'
      fill_in 'Password', with: '123456'
      find('input[name="commit"]').click
    end

    it 'redirects to the groups page' do
      visit new_group_entity_path(@group1.id)
      fill_in 'Name', with: 'Transaction 2'
      fill_in 'Amount', with: 22
      check('entity_group_ids_1')
      click_on 'Save'
      expect(page).to have_current_path(group_entities_path(@group1.id))
    end

    it 'Can shows notice of You should select at least one category' do
      visit new_group_entity_path(Group.first.id)
      fill_in 'Name', with: 'Transaction 2'
      fill_in 'Amount', with: 22
      click_on 'Save'
      expect(page).to have_content('You should select at least one category')
    end
  end
end
