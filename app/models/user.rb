class User < ActiveRecord::Base
  has_secure_password
  after_destroy :ensure_an_admin_remains
  validates :name, presence: true, uniqueness: true

  private
  def ensure_an_admin_remains
    if User.count.zero?
      raise "The last Admin can not de deleted"
    end
  end
end

# https://github.com/codahale/bcrypt-ruby
# https://gist.github.com/mpakus/7141452
