class User < ActiveRecord::Base
  has_secure_password
  after_destroy :ensure_an_admin_remains

  private
  def ensure_an_admin_remains
    if User.count.zero?
      raise "Последний пользователь не может быть удален"
    end
  end
end

# https://github.com/codahale/bcrypt-ruby
# https://gist.github.com/mpakus/7141452
