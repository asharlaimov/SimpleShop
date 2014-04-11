# To run: rails runner script/load_users.rb

User.transaction do
  (1..100).each do |i|
    user = "user#{i}"
    User.create(name: user, password: user, password_confirmation: user)
  end
end