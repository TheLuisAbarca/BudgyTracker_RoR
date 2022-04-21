require 'rails_helper'

RSpec.describe 'Group Index Page', type: :feature do
  describe 'testing Index Action' do
    before(:each) do
      @user = User.create!(name: 'Ashley', email: 'kabarca@gmail.com', password: '123456',
                           password_confirmation: '123456')
      @group1 = Group.create!(name: 'name1', icon: 'wwww.testicon.com', author_id: @user.id)
      @group2 = Group.create!(name: 'name2', icon: 'wwww.testicon.com', author_id: @user.id)
      @group3 = Group.create!(name: 'name3', icon: 'wwww.testicon.com', author_id: @user.id)
      @entity1 = Entity.create(name: 'Extra Jobs', amount: 55)
      visit new_user_session_path
      fill_in 'Email', with: 'kabarca@gmail.com'
      fill_in 'Password', with: '123456'
      find('input[name="commit"]').click
      visit groups_path
    end

    it 'Can see name1' do
      expect(page).to have_content 'name1'
    end

    it 'The label CATEGORIES exists.' do
      expect(page).to have_content 'CATEGORIES'
    end

    it 'The button New Category exists.' do
      expect(page).to have_link 'New Category'
    end
  end
end
