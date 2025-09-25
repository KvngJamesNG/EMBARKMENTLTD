description = <<-DESCRIPTION
<div class="text-2xl font-bold mb-4 text-center">
Explore the Wonderful World of Fruits 
</div>
    <h4 class="font-medium">Nutritional Value</h4>
    <p>Fruits are naturally rich in vital nutrients, offering essential vitamins and minerals that support overall wellness. They are well known for their high vitamin C content, potassium, folate, and fiber, making them an important part of a balanced diet. Many fruits also contain plant compounds called phytonutrients that act as antioxidants, helping protect the body&rsquo;s cells from damage.</p>
    <h4 class="font-medium">Health Benefits</h4>
    <p>Consuming fruits regularly can promote heart health, aid digestion, and boost immunity. Fruits may help lower cholesterol levels, regulate blood pressure, and provide anti-inflammatory effects throughout the body. Many studies link fruit consumption with a reduced risk of chronic diseases such as diabetes, certain cancers, and obesity.</p>
    <h4 class="font-medium">Versatility in Diet</h4>
    <p>Fruits can be enjoyed in countless ways, from fresh eating to cooking and baking. They add color, flavor, and variety to every meal, making them easy to incorporate into breakfasts, salads, desserts, and savory dishes alike. Their naturally sweet taste means they are also a healthier alternative to processed snacks and desserts.</p>
    <h4 class="font-medium">Seasonal and Global Availability</h4>
    <p>Whether grown locally or imported from distant regions, fruits are available all year round in a wide range of varieties. Each season offers its own unique selection, so enjoying fruit can be both a local and global experience. This abundance allows people everywhere to reap the benefits no matter where they live.</p>
    <h4 class="font-medium ">A Colorful Addition</h4>
    <p>Fruits display vibrant colors that are both visually appealing and symbolic of their nutritional diversity. Eating fruits in a rainbow of colors ensures a wider intake of different phytonutrients, each with specific health-promoting effects. This variety not only supports health but also makes meals more exciting and inviting.</p>
    <h4 class="font-medium">Policy</h4>
    <p>We are committed to sustainable and ethical sourcing of our fruits. We work closely with farmers who prioritize environmentally friendly practices, ensuring that our products are not only good for you but also good for the planet. Our quality control measures guarantee that every fruit we sell meets the highest standards of freshness and safety.</p>
DESCRIPTION

user = User.create!({
  email: 'test@gmail.com',
  password: 'test123',
  password_confirmation: 'test123'
})

6.times do |i|
  product = Product.create!(
      {
        name: Faker::Food.fruits,
        description: description,
        headline: Faker::Lorem.sentence(word_count: 6),
      address_1: Faker::Address.street_address,
      address_2: Faker::Address.secondary_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      country: Faker::Address.country,
      price: Money.from_amount(Faker::Number.decimal(l_digits: 2), "GBP"),
      quantity: (1..100).to_a.sample,
      unit: ["kg", "g", "lbs", "oz", "liters", "ml"].sample,
      packaging: ["/Box", "/Bag", "/Crate", "/Basket"].sample,
      quality: ["Grade A", "Grade B", "Grade C"].sample,
      harvest_info: ["Freshly harvested", "Stored for a week", "Frozen", "Non-GMO"].sample
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
