require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "They can navigate from the home page to the product detail page by clicking on a product" do
    visit root_path

    all(:xpath, "//a[@href='/products/1']").first.click
    
    expect(page).to have_content 'Quantity'
    puts page.html
    save_screenshot 'product_page.png'
  end

end
