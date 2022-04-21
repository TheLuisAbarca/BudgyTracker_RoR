# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Entities', type: :feature do
  describe 'new' do
    before(:each) do
      @user = User.create!(name: 'Ashley', email: 'kabarca@gmail.com', password: '123456',
                           password_confirmation: '123456')
      visit new_user_session_path
      fill_in 'Email', with: 'kabarca@gmail.com'
      fill_in 'Password', with: '123456'
      find('input[name="commit"]').click
    end

    it 'redirects to the groups page' do
      visit new_group_entity_path(Group.first.id)
      fill_in 'Name', with: 'Transaction 2'
      fill_in 'Amount', with: 22
      click_on 'Save'
      expect(page).to have_current_path(group_entities_path(Group.first.id))
    end

    it 'Can shows notice of You should select at least one category' do
      visit new_group_entity_path(Group.first.id)
      fill_in 'Name', with: 'Transaction 2'
      fill_in 'Amount', with: 22
      click_on 'Save'
      expect(page).to have_content('Transaction 2')
    end
  end
end
