class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize

  def index
    if params[:filter]
      @products = Product.where(:category_id => params[:filter])
    else
      @products = Product.all
    end
  end
end