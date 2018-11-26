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

spreadsheet = Roo::Spreadsheet.open('app/assets/data/goods.xlsx')
# spreadsheet.each_row do |row|
#   puts row.inspect # Array of Excelx::Cell objects
# end
# puts spreadsheet.row(1)
header =  spreadsheet.first_row
# puts spreadsheet.row(header)
puts row = Hash[header, spreadsheet.row(2)]
puts row.inspect 

puts 'End'
puts spreadsheet.row(2)

(2..spreadsheet.last_row).each do |i|
  Good.create(
    title: spreadsheet.row(i)[0],
    2017-03-01 => spreadsheet.row(i)[1],
    2017-03-02 => spreadsheet.row(i)[2],
    2017-03-03 => spreadsheet.row(i)[3],
    2017-03-04 => spreadsheet.row(i)[4],
    2017-03-05 => spreadsheet.row(i)[5],
    2017-03-06 => spreadsheet.row(i)[6],
    2017-03-07 => spreadsheet.row(i)[7],
    2017-03-08 => spreadsheet.row(i)[8],
    2017-03-09 => spreadsheet.row(i)[9],
    2017-03-10 => spreadsheet.row(i)[10],
    2017-03-11 => spreadsheet.row(i)[11],
    2017-03-12 => spreadsheet.row(i)[12],
    2017-03-13 => spreadsheet.row(i)[13],
    2017-03-14 => spreadsheet.row(i)[14],
    2017-03-15 => spreadsheet.row(i)[15],
    2017-03-16 => spreadsheet.row(i)[16],
    2017-03-17 => spreadsheet.row(i)[17],
    2017-03-18 => spreadsheet.row(i)[18],
    2017-03-19 => spreadsheet.row(i)[19],
    2017-03-20 => spreadsheet.row(i)[20],
    2017-03-21 => spreadsheet.row(i)[21] 
    )
end

# (2..spreadsheet.last_row).each do |i|


#   row = Hash[header, spreadsheet.row(i)]
#   # Good.create
#   # Good = find_by_id(row["id"]) || new
#   Good.attribute = row.to_hash.slice(*accessible_attributes)
#   Good.save!
#   # puts row
# end

# (2..spreadsheet.last_row).each do |i|
#   row = Hash[header, spreadsheet.row(i)]
#   Good.create
#   # product = find_by_id(row["id"]) || new
#   Good.attributes = row.to_hash.slice(*accessible_attributes)
#   Good.save!
#   # puts row
# end

# CSV.foreach('SeedsSpill.csv') do |row|
#   url = row[0]
#   reported = row[1]
#   incident = row[2]
#   county = row[3]
#   lat = row[4].to_f
#   long = row[5].to_f
#   contaminant = row[6]
#   volume = row[7].to_i
#   units = row[8]
#   contained = row[9]
#   user_id = row[10].to_i
#   Spill.create(IncidentURL: url, DateReported: reported, DateIncident: incident, County: county, Latitude: lat, Longitude: long, Contaminant: contaminant, Volume: volume, Units: units, Contained: contained, user_id: user_id,) 
# end
# puts "done"