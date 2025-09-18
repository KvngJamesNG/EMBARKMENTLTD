user = User.create!({
  email: 'test@gmail.com',
  password: 'password',
  password_confirmation: 'password'
})

6.times do |i|
  product = Product.create!(
      {
        name: Faker::Food.fruits,
        description: Faker::Lorem.paragraph(sentence_count: 10),
        headline: Faker::Lorem.sentence(word_count: 6),
      address_1: Faker::Address.street_address,
      address_2: Faker::Address.secondary_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      country: Faker::Address.country,
      price: Money.from_amount(Faker::Number.decimal(l_digits: 2), "GBP"),
    }
)

product.images.attach(io: File.open("db/images/product_#{i + 1}.png"), filename: product.name)
product.images.attach(io: File.open("db/images/product_7.png"), filename: product.name)
product.images.attach(io: File.open("db/images/product_8.png"), filename: product.name)
product.images.attach(io: File.open("db/images/product_9.png"), filename: product.name)
product.images.attach(io: File.open("db/images/product_10.png"), filename: product.name)
product.images.attach(io: File.open("db/images/product_11.png"), filename: product.name)
product.images.attach(io: File.open("db/images/product_12.png"), filename: product.name)
product.images.attach(io: File.open("db/images/product_13.png"), filename: product.name)
product.images.attach(io: File.open("db/images/product_14.png"), filename: product.name)


((5..10).to_a.sample).times do
  Review.create!({
    product: product,
    content: Faker::Lorem.paragraph(sentence_count: 10),
    quality_rating: (1..5).to_a.sample,
    packaging_rating: (1..5).to_a.sample,
    delivery_rating: (1..5).to_a.sample,
    accuracy_rating: (1..5).to_a.sample,
    communication_rating: (1..5).to_a.sample,
    location_rating: (1..5).to_a.sample,
    value_rating: (1..5).to_a.sample,
    user: user
  })
  end
end
