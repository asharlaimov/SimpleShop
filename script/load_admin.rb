# To run: rails runner script/load_admin.rb

User.create(name: 'admin', password: 'admin', password_confirmation: 'admin')