class Recommended < ActiveRecord::Base
  belongs_to :product, touch: true
  validates :product, presence: true, uniqueness: true
  validates :position, presence: true

  def self.latest
    Recommended.order(:updated_at).last
  end
end