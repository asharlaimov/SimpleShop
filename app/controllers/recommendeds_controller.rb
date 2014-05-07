class RecommendedsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :require_admin_rights, except: [:index]

  # GET /recommendeds
  # GET /recommendeds.json
  def index
    @recommendeds = Recommended.order(:position)
  end

  # POST /recommendeds/sort
  def sort
    recommendeds_ids = params[:recommended]
    n = 0
    Recommended.transaction do
      recommendeds_ids.each do |id|
        rec = Recommended.find(id)
        rec.position = n += 1
        rec.save!
      end
    end

    respond_to do |format|
      format.html { redirect_to recommendeds_index_path }
      format.json { render json: {} }
    end

  end

  def add
    last = Recommended.last
    pos = last.nil? ? 1 : last.position
    @recommended = Recommended.new(product_id: params[:id], position: pos)

    respond_to do |format|
      if @recommended.save
        format.html { redirect_to request.referer }
      else
        format.html { redirect_to request.referer, notice: 'Unable add to recommended or already added' }
      end
    end
  end

  def destroy
    @recommended = Recommended.find_by_id(params[:id])
    @recommended.destroy unless @recommended.nil?

    respond_to do |format|
      format.html { redirect_to request.referer }
    end
  end
end
