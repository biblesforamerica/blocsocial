require 'spec_helper'

feature 'User can sign in using facebook' do

  scenario 'successfully' do
    visit root_path
    click_link 'Sign In'
    click_link 'Sign in with Facebook'
    fill_in 'Email or Phone', with: 'iedidiah@gmail.com'
  end
end
