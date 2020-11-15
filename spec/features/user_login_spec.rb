require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  
  scenario 'users can login successfully and are taken to the home page once they are signed in' do
    @user = User.create!(
      first_name: 'Bim', 
      last_name: 'Jenning', 
      email: 'test@test.ca', 
      password: 'bimjenning', 
      password_confirmation: 'bimjenning'
    )

    visit root_path

    find_link('Login').click

    #DEBUG 1 
    # sleep 1
    # save_screenshot

    expect(page).to have_content('Login')
    fill_in 'session[email]', with: @user.email
    fill_in 'session[password]', with: @user.password

    find('input.btn').click

    #DEBUG 2 
    sleep 1
    save_screenshot
    
    expect(page).to have_content('Bim Jenning')
    expect(page).to have_link('Logout')
  end

end
