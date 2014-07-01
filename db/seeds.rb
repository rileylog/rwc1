# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(email: 'user@example.com', password: 'changeme')
user.add_role :user
user = User.create!(email: 'tester@example.com', password: 'changeme')
user.add_role :user
user = User.create!(email: 'rileylog@gmail.com', password: 'changeme')
user.add_role :admin
user = User.create!(email: 'alex.howington@gmail.com', password: 'changeme')
user.add_role :admin

slv_central = ListingArea.new(name: 'SLV Central', policy: 'Salt Lake Valley Central policy goes here')
slv_central.kml = File.open(File.join(Rails.root, "/test/fixtures/SLV_Central.kml"))
slv_central.save!
ListingArea.parse_kml(slv_central.id)
slv_east = ListingArea.new(name: 'SLV East', policy: 'Salt Lake Valley East policy goes here')
slv_east.kml = File.open(File.join(Rails.root, "/test/fixtures/SLV_East.kml"))
slv_east.save!
ListingArea.parse_kml(slv_east.id)
slv_north = ListingArea.new(name: 'SLV North', policy: 'Salt Lake Valley North policy goes here')
slv_north.kml = File.open(File.join(Rails.root, "/test/fixtures/SLV_North.kml"))
slv_north.save!
ListingArea.parse_kml(slv_north.id)
slv_west = ListingArea.new(name: 'SLV West', policy: 'Salt Lake Valley West policy goes here')
slv_west.kml = File.open(File.join(Rails.root, "/test/fixtures/SLV_West.kml"))
slv_west.save!
ListingArea.parse_kml(slv_west.id)

Wanted.create!(volume: 20, source: 'Surface', description: 'Need 5 to 20 acre feet of Strawberry Water.', listing_area_id: slv_central.id)
Wanted.create!(volume: 100, source: 'Surface', description: 'Need water from irrigation companies that take water from the Spanish Fork River or Strawberry Water.', listing_area_id: slv_central.id)
Wanted.create!(volume: 40, source: 'Surface or Well', description: 'Need 30 to 40 acre-feet to move to a combination of well and Provo River water. Washington and South Kamas shares will work, however, 1st class Provo River rights are preferred.', listing_area_id: slv_north.id)
Wanted.create!(volume: 15, source: 'Well', description: 'Need 10 to 20 acre-feet of water and will only purchase based on approved change application', listing_area_id: slv_north.id)
Wanted.create!(volume: 10, source: 'Well', description: 'Need this water for a few lots in a development.', listing_area_id: slv_north.id)
