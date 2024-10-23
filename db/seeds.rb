require 'csv'
require 'faker'
require 'net/http'
require 'json'

# Function to fetch data from the CoinRanking API
def fetch_cryptocurrencies
  url = 'https://api.coinranking.com/v2/coins'
  api_key = 'coinranking39b35c786e31231eb5f6299274400d8f8322a7102f6e7c88'  # Replace with your actual CoinRanking API key
  uri = URI(url)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri)
  request['x-access-token'] = api_key
  response = http.request(request)
  JSON.parse(response.body)['data']['coins']
end

# Seed Cryptocurrencies from CoinRanking API
puts "Seeding Cryptocurrencies from CoinRanking API..."
cryptocurrencies = fetch_cryptocurrencies
cryptocurrencies.each do |coin|
  Cryptocurrency.create(
    name: coin['name'],
    symbol: coin['symbol'],
    price: coin['price'].to_f,
    market_cap: coin['marketCap'].to_i,
    volume: coin['24hVolume'].to_i,
    change: coin['change'].to_f
  )
end

# Seed Users using Faker (Increased to 30 users)
puts "Seeding Users with Faker..."
30.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email
  )
end

# Seed Transactions using Faker (Increased to 10 transactions per user)
puts "Seeding Transactions with Faker..."
User.all.each do |user|
  10.times do
    Transaction.create(
      user: user,
      cryptocurrency: Cryptocurrency.order('RANDOM()').first,
      amount: Faker::Number.decimal(l_digits: 2, r_digits: 3),
      transaction_type: ['buy', 'sell'].sample
    )
  end
end

# Seed Exchanges from CSV file
puts "Seeding Exchanges from CSV..."
csv_file_path = Rails.root.join('db', 'csv', 'exchanges.csv')  # Ensure the CSV file is located in db/csv directory
CSV.foreach(csv_file_path, headers: true) do |row|
  Exchange.create(
    name: row['name'],
    location: row['location']
  )
end

# Associate Cryptocurrencies with Exchanges (each cryptocurrency is associated with 2 exchanges)
puts "Associating Cryptocurrencies with Exchanges..."
Cryptocurrency.all.each do |crypto|
  Exchange.all.sample(2).each do |exchange|
    crypto.exchanges << exchange
  end
end

puts "Seeding completed successfully!"
