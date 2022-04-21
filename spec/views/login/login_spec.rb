require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  describe 'In login page,' do
    before(:each) do
      User.create(name: 'Ashley', email: 'kabarca@gmail.com', password: '123456', password_confirmation: '123456')
      visit new_user_session_path
    end
    it 'The email input exist' do
      expect(page).to have_field('Email')
    end

    it 'The password input exist.' do
      expect(page).to have_field('Password')
    end

    it 'The submit button exist.' do
      expect(page).to have_button('Log In')
    end

    it 'When I click the submit button without filling in the username and the password,
    I get an specific message.' do
      find('input[name="commit"]').click
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'When I click the submit button after filling in the username and the password with incorrect data,
    I get an specific message.' do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      find('input[name="commit"]').click
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'When I click the submit button after filling in the username and the password with correct data,
    I am redirected to the root page.' do
      fill_in 'Email', with: 'kabarca@gmail.com'
      fill_in 'Password', with: '123456'
      find('input[name="commit"]').click
      expect(page).to have_current_path(groups_path)
    end
  end
end
