require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do

    before :each do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      # products for order
      @product1 = Product.create!(
        name: 'Electric Chair',
        description: Faker::Hipster.paragraph(4),
        image: open_asset('furniture2.jpg'),
        quantity: 5,
        price: 200.00,
        category_id: 1
      )

      @product2 = Product.create!(
        name: 'Red Bookshelf',
        description: Faker::Hipster.paragraph(4),
        image: open_asset('furniture3.jpg'),
        quantity: 5,
        price: 400.00,
        category_id: 1
      )

      # product not included in order
      @product3 = Product.create!(
        name:  'Hotdog Slicer',
        description: Faker::Hipster.paragraph(4),
        image: open_asset('electronics2.jpg'),
        quantity: 3,
        price: 26.00,
        category_id: 1
      )
    end

    # pending test 1
    it 'deducts quantity from products based on their line item quantities only if product is included in order' do
      # 1. initialize order with necessary fields
      @order = Order.new(
        email: 'test@test.ca',
        total_cents: 80000,
        stripe_charge_id: 'testid'
      )
      # 2. build line items on @order
      @order.line_items.new(
        product_id: 1,
        quantity: 2,
        item_price: 40000,
        total_price: 40000
      )
      @order.line_items.new(
        product_id: 2,
        quantity: 1,
        item_price: 40000,
        total_price: 40000
      )
      # 3. save! the order
      @order.save!

      
      line_items.each do |item|
        product = Product.find_by(id: item.product_id)
        product.quantity -= item.quantity
        product.save
      end

      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq(3)
      expect(@product2.quantity).to eq(4)
      expect(@product3.quantity).to eq(3)
    end
  end
end