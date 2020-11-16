class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_email(order)
    @order = order
    @user = User.where(email: @order.email)
    @line_items = LineItem.where(order_id: @order.id)
    @products = @line_items.map { |line| { item_price_cents: line.item_price_cents, 
        quantity: line.quantity, total_price_cents: line.total_price_cents, product: Product.select('name').where(id: line.product_id) } }
    @url = 'http://localhost:3000/'
    mail(to: @order.email, subject: "Thank you for your order! Order ID: #{order.id}")
  end

end
