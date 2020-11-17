class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @line_items = LineItem.where( order_id: @order.id)
    sale = Sale.active
    discount = sale ? sale[0].percent_off : 0
    @products = @line_items.map { |product| { product: Product.find(product[:product_id]), percent_off: discount, quantity: product[:quantity] } }
  end

  def order_subtotal_cents
    sale = Sale.active
    if sale 
      @products.map {|entry| price = (entry[:product].price_cents * (1.00 - (sale[0].percent_off * 0.01))).to_i
        price * entry[:quantity]}.sum
    else 
      @products.map {|entry| entry[:product].price_cents * entry[:quantity]}.sum
    end
  end
  helper_method :order_subtotal_cents
    
  def savings 
    sale = Sale.active
    sale_price = sale ? @products.map {|entry| price = (entry[:product].price_cents * (1.00 - (sale[0].percent_off * 0.01))).to_i
      price * entry[:quantity]}.sum 
      : 0
    ((@products.map {|entry| entry[:product].price_cents * entry[:quantity]}.sum) - sale_price) / 100.0
  end
  helper_method :savings

  def create
    charge = perform_stripe_charge
    order  = create_order(charge)

    if order
      if order.valid?
        empty_cart!
        # Tell the UserMailer to send a confirmation email with order details
        UserMailer.order_email(order).deliver_now
        # Show orde confirmation
        redirect_to order, notice: 'Your Order has been placed.'
      else
        redirect_to cart_path, flash: { error: order.errors.full_messages.first }
      end
    else
      puts 'GOING THE WRONG WAY'
      redirect_to cart_path
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_subtotal_cents,
      description: "Jungle Order",
      currency:    'cad'
    )
  end

  def create_order(stripe_charge)
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )
    sale = Sale.active

    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      price = sale ? product.price * (1.00 - (sale[0].percent_off * 0.01)) : product.price

      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: price,
        total_price: price * quantity
      )
    end
    order.save!
    order
  end

end