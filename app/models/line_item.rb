class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    product = Product.find(product_id)
    price = product.price
    return price * quantity
  end
end
