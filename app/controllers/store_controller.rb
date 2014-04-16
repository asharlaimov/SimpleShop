class StoreController < ApplicationController
  include CurrentCart
  include CurrentRecommended
  before_action :set_cart, :set_recommendeds
  skip_before_action :authorize

  def index
    if params[:filter]
      @products = Product.where(:category_id => params[:filter])
    else
      @products = Product.all
    end
  end
end