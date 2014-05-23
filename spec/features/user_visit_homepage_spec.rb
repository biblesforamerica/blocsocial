require 'spec_helper'

feature 'User visits homepage and signs in' do
  scenario 'succesfully' do
    visit root_path
    click_link 'Sign In'
  end
end
