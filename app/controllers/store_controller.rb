class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.all
    if session[:counter] == nil
      session[:counter] = 1
    else
      session[:counter] += 1
    end
    puts "STORE CONTROLLER COUNTER: #{session[:counter]}"
  end
end
