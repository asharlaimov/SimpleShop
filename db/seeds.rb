# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
# encoding: utf-8
User.delete_all
User.create(name: 'admin', password: 'admin', password_confirmation: 'admin', admin: true)
User.create(name: 'user1', password: 'user1', password_confirmation: 'user1', admin: false)

Category.delete_all
category = Category.create!(name: 'Ruby')
category2 = Category.create!(name: 'C#')
Category.create!(name: 'Java')
Category.create!(name: 'Php')

Recommended.delete_all
Product.delete_all
Product.create!(title: 'CoffeeScript', category: category,
                description:
                    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>},
                image_url: 'cs.jpg',
                price: 36.00)
# . . .
product1 = Product.create!(title: 'Programming Ruby 1.9 & 2.0', category: category,
                           description:
                               %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
                           image_url: 'ruby.jpg',
                           price: 49.95)
# . . .

product2 = Product.create!(title: 'Rails Test Prescriptions', category: category,
                          description:
                              %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
                          image_url: 'rtp.jpg',
                          price: 34.95)

Product.create!(title: 'CLR via C#', category: category2,
                description:
                    %{<p>
        <em>CLR via C#</em> Программирование на платформе Microsoft .NET Framework 2.0 на языке C#
      </p>},
                image_url: 'blank.png',
                price: 50.01)

rec1 = Recommended.new(position: 2)
product1.recommended = rec1
rec1.save!

rec2 = Recommended.new(position: 1)
product2.recommended = rec2
rec2.save!