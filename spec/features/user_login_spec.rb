require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    User.create!(
      name: 'Bill',
      email: 'test@test.com',
      password: '123456',
      password_confirmation: '123456'
    )
  end

  scenario "They can click login from home page, then login using correct credentials" do
    visit root_path
    
    click_on 'Login'

    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: '123456'
    save_screenshot 'Login_page_filled_out.png'

    click_on 'Submit'

    expect(page).to have_content 'Logout'

    save_screenshot 'Logged_on.png'
  end
end
