module CurrentRecommended
  extend ActiveSupport::Concern

  private
  def set_recommendeds
    @recommendeds = Recommended.order(:position)
  end
end