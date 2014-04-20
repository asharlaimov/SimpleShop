class StoreController < ApplicationController
  include CurrentCart
  include CurrentRecommended
  before_action :set_cart, :set_recommendeds
  skip_before_action :authorize
  helper_method :page_items_count

  def page_items_count
    [5, 10, 50]
  end

  def index
    @query = params[:query]
    @page_size = params[:page_size] || page_items_count.first
    @products = Product.filter_category(params[:filter]).filter_page(params[:page], @page_size).filter_query @query
  end
end