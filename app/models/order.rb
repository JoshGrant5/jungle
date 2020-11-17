class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  before_create :check_stock

  after_create :adjust_stock

  private

  def check_stock
    self.line_items.each do |item|
      product = Product.find_by(id: item.product_id)
      if product.quantity < item.quantity
        raise ActiveRecord::Rollback
        redirect '/'
      end
    end
  end

  def adjust_stock
    self.line_items.each do |item|
      product = Product.find_by(id: item.product_id)
      product.quantity -= item.quantity
      product.save
    end
  end

end
