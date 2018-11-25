# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'real_estate_transactions.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   t = Transaction.new
#   t.street = row['street']
#   t.city = row['city']
#   t.zip = row['zip']
#   t.zip = row['zip']
#   t.state = row['state']
#   t.beds = row['beds']
#   t.sq_feet = row['sq_feet']
#   t.category = row['type']
#   t.sale_date = row['sale_date']
#   t.price = row['price']
#   t.lat = row['latitude']
#   t.lng = row['longitude']
#   t.save
#   puts "#{t.street}, #{t.city} saved"
# end

# puts "There are now #{Transaction.count} rows in the transactions table"

require 'roo'

puts "Importing Facilities..."
spreadsheet = Roo::Spreadsheet.open('app/assets/data/goods.xlsx')
# spreadsheet.each_row do |row|
#   puts row.inspect # Array of Excelx::Cell objects
# end
puts spreadsheet.row(2)