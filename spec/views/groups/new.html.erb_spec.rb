require 'rails_helper'

RSpec.describe 'Groups new page', type: :feature do
  describe 'testing New action' do
    before(:each) do
      @user = User.create!(name: 'Ashley', email: 'kabarca@gmail.com', password: '123456',
                           password_confirmation: '123456')
      @group1 = Group.create!(name: 'name1', icon: 'wwww.testicon.com', author_id: @user.id)
      @group2 = Group.create!(name: 'name2', icon: 'wwww.testicon.com', author_id: @user.id)
      @group3 = Group.create!(name: 'name3', icon: 'wwww.testicon.com', author_id: @user.id)
      visit new_user_session_path
      fill_in 'Email', with: 'kabarca@gmail.com'
      fill_in 'Password', with: '123456'
      find('input[name="commit"]').click
    end

    it 'shows an error when submit button is clicked and no name and/or icon have been filled' do
      visit groups_path
      click_on 'New Category'
      visit new_group_path
      click_on 'Save'
      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Icon can't be blank"
    end

    it 'Can save a new groups' do
      visit new_group_path
      fill_in 'Name', with: 'Group 10'
      fill_in 'Icon', with: 'https://www.shareicon.net/data/128x128/2017/07/13/888381_globe_512x512.png'
      click_on 'Save'
      expect(page).to have_current_path(groups_path)
    end
  end
end
