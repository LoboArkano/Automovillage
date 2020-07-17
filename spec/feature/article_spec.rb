require_relative '../rails_helper'

RSpec.describe 'Webpage workflow', type: :system do
  describe 'Navigate the webpage' do
    it 'create an article and like it' do
      User.create(name: 'Jaskier')
      Category.create(name: 'Formula 1',priority: 1)
      visit sessions_log_in_path
      fill_in 'Enter your username:', with: 'Jaskier'
      click_on 'Login'
      sleep(3)
      click_on 'CREATE ARTICLE'
      fill_in 'article[title]', with: 'NASCAR hosts largest sporting event crowd since pandemic'
      fill_in 'article[text]', with: "BRISTOL, Tenn. (AP) — Clint Bowyer hopped off his pit stand at Bristol Motor Speedway to learn he’d won the fan vote to advance into NASCAR’s All-Star race — an announcement met by a roar from the grandstands."
      find('form input[type="file"]').set('./spec/images/nascar.jpeg')
      check 'category_ids_'
      sleep(3)
      click_on 'Create Article'
      sleep(3)
      click_on 'Formula 1'
      sleep(3)
      click_on '0 - Add Vote'
      sleep(3)
    end
  end
end