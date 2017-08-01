require 'test_helper'

class ProductTest < ActiveSupport::TestCase
   test "the truth" do
     assert(products(:ruby))
   end

  test"Product is not valid without a unique title" do
    product = Product.new(title: products(:ruby).title,
                          description: "newDesc",
                          image_url: "img.gif",
                          price: 10.00)
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

  test "Product is not valid without price greater-than zero" do
    products(:ruby).price = -0.01
    assert products(:ruby).invalid?
    assert_equal ["mst be greater than or equal to 0.01"], products(:ruby).errors[:price]
    puts products(:ruby).errors[:price]
  end
end
