# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def receipt_email
    # UserMailer.with(user: User.first).welcome_email
    order = Order.new(id: 1, email: "joshgg@icloud.com", total_cents: 152600,stripe_charge_id: "ch_1HoFSdJS3zNn7w5dA3iBZJgW")
    line_item1 = LineItem.new(product_id: 12, quantity: 1, item_price_cents: 152600, total_price_cents: 248375, order_id: 1)
    send_email = UserMailer.order_email(order)
  end

end
