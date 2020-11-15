require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  #SETUP
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

  scenario 'users can navigate from the home page to the product detail page by clicking on a product name' do
    visit root_path
    expect(page).to have_css 'article.product', count: 10

    # Click on product name 
    product = Product.first
    click_on product.name

    #DEBUG
    # sleep 1
    # save_screenshot

    # VERIFY
    expect(page).to have_content('Apparel')
    expect(page).to have_css 'section.products-show'
    expect(page).to have_css 'article.product-detail'
  end

end
