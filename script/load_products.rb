# To run: rails runner script/load_products.rb

categories = Category.last(2)
rand = Random.new
Product.transaction do
  Product.where("title LIKE (?)", "product_%").destroy_all
  (1..8).each do |i|
    Product.create!(title: "product_#{i}", description: "<p>description #{i} for product<p>", image_url: 'blank.png', price: rand.rand(30...80), category: categories.sample)
  end
end