class Category < ActiveRecord::Base
  has_many :products
  before_destroy :ensure_not_referenced

  private
  # убеждаемся в отсутствии продуктов, ссылающихся на данный товар
  def ensure_not_referenced
    if products.empty?
      true
    else
      errors.add(:base, 'Unable to delete because some products reference to this category')
      false
    end
  end
end
