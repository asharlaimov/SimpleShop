class Recommended < ActiveRecord::Base
  belongs_to :product
  validates :product, presence: true, uniqueness: true
  validates :position, presence: true
end
