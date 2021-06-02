require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can click 'Add to Cart' for a product, check to see if 'Cart' count increases by one" do
    visit root_path
    save_screenshot 'Pre_Add_to_cart.png'

    # all(:xpath, "//a[@href='/products/1']").first.click
    click_button 'Add', match: :first
    expect(page).to have_content 'Cart (1)'
    # puts page.html
    save_screenshot 'Post_Add_to_cart.png'
  end
end
