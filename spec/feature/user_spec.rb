require_relative '../rails_helper'

RSpec.describe 'Webpage workflow', type: :system do
  describe 'Navigate the webpage' do
    it 'creates a new user and login' do
      Category.create(name: 'Formula 1', priority: 1)
      visit new_user_path
      fill_in 'Enter your username:', with: 'Geralt'
      click_on 'Create Account'
      sleep(3)
      expect(page).to have_content('Your account has been created!')
      fill_in 'Enter your username:', with: 'Geralt'
      click_on 'Login'
      sleep(3)
      expect(page).to have_content('Login completed')
      click_on 'LOGOUT'
      sleep(3)
    end
  end
end
