class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items
  has_one :recommended, :dependent => :destroy
  belongs_to :category
  before_destroy :ensure_not_referenced

  validates :title, :description, :image_url, :category, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
      # URL должен указывать на изображение формата GIF, JPG или PNG
  }

  def self.latest
    Product.order(:updated_at).last
  end

  def self.filter_category categories
    if categories.present?
      where(:category_id => categories) if categories.present?
    else
      all
    end
  end

  def self.filter_query query
    if query.present?
      where("[title] like ? or [description] like ?", "%#{query}%", "%#{query}%")
    else
      all
    end
  end

  def self.filter_page page = 1, page_size = 5
    page(page).per(page_size)
  end

  default_scope order('created_at DESC')

  private
  # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
  def ensure_not_referenced
    if line_items.empty?
      true
    else
      errors.add(:base, 'существуют товарные позиции')
      false
    end
  end
end