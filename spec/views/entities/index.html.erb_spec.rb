# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Entities', type: :feature do
  describe 'Testing Index Actions' do
    before(:each) do
      @user = User.create!(name: 'Ashley', email: 'kabarca@gmail.com', password: '123456',
                           password_confirmation: '123456')
      @group1 = Group.create!(name: 'name1', icon: 'wwww.testicon.com', author_id: @user.id)
      @group2 = Group.create!(name: 'name2', icon: 'wwww.testicon.com', author_id: @user.id)
      @group3 = Group.create!(name: 'name3', icon: 'wwww.testicon.com', author_id: @user.id)
      @entity1 = @group1.entities.create(name: 'Extra Jobs', amount: 55, author_id: @user.id)
      visit new_user_session_path
      fill_in 'Email', with: 'kabarca@gmail.com'
      fill_in 'Password', with: '123456'
      find('input[name="commit"]').click
      visit group_entities_path(Group.first.id)
    end

    it 'Can see Games' do
      expect(page).to have_content 'Games'
    end

    it 'Can see $ 54' do
      expect(page).to have_content '$ 54.0'
    end

    it 'Can see Group 1' do
      expect(page).to have_content 'Group 1'
    end

    it 'Can see $ 22' do
      expect(page).to have_content '$ 22.0'
    end
  end
end
