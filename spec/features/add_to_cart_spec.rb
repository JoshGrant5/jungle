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

  scenario "clicking 'Add to Cart' button changes  'My Cart (0)' to 'My Cart (1)'" do

    visit root_path
    expect(page).to have_css 'article.product', count: 10

    find_button('Add', match: :first).click

    #DEBUG
    # sleep 1
    # save_screenshot

    #VERIFY
    expect(page).to have_content 'My Cart (1)'
    expect(page).to have_link 'My Cart (1)', href: '/cart'

  end
  
end
