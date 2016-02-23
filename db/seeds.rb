# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create!(name: 'Job Interview at Apple',
              address: '1 Infinite Loop, Cupertino, California 95014',
              user_email: 'getmovingfinalproject@gmail.com',
              start_time: DateTime.parse('2016-02-22T21:31:46+00:00'),
              departure_time: DateTime.parse('2016-02-22T21:31:46+00:00'),
              device_token: "1234556575478768632456458674",
              user_lat: '40.7332578',
              user_lng: '-74.0252455',
              event_lat: '40.758740',
              event_lng: '-73.978674'
              )

# Event.create!(name: 'Job Interview at Google',
#               address: '1600 Amphitheatre Parkway in Mountain View, Santa Clara County, California',
#               user_email: 'getmovingfinalproject@gmail.com',
#               start_time: DateTime.parse('2016-02-22T21:31:46+00:00'),
#               departure_time: DateTime.parse('2016-02-22T21:31:46+00:00'),
#               device_token: "123455657547876213576458674"
#               )

# Event.create!(name: 'Job Interview at Facebook',
#               address: '1 Hacker Way, Palo Alto, California 12345',
#               user_email: 'getmovingfinalproject@gmail.com',
#               start_time: DateTime.parse('2016-02-22T21:31:46+00:00'),
#               departure_time: DateTime.parse('2016-02-22T21:31:46+00:00'),
#               device_token: "123455657547876868576478974"
#               )

# Event.create!(name: 'Job Interview at Duane Reade',
#               address: '60 Wall street',
#               user_email: 'getmovingfinalproject@gmail.com',
#               start_time: DateTime.parse('2016-02-22T21:31:46+00:00'),
#               departure_time: DateTime.parse('2016-02-22T21:31:46+00:00'),
#               device_token: "123455654257876868576458674"
#               )

# Event.create!(name: 'Job Interview at CVS',
#               address: '60 Wall street',
#               user_email: 'getmovingfinalproject@gmail.com',
#               start_time: DateTime.parse('2016-02-22T21:31:46+00:00'),
#               departure_time: DateTime.parse('2016-02-22T21:31:46+00:00'),
#               device_token: "123455657547878968576458674"
#               )

# Event.create!(name: 'Job Interview at Toys R Us',
#               address: '60 Wall street',
#               user_email: 'getmovingfinalproject@gmail.com',
#               start_time: DateTime.parse('2016-02-22T21:31:46+00:00'),
#               departure_time: DateTime.parse('2016-02-22T21:31:46+00:00'),
#               device_token: "123455564547876868576458674"
#               )

# Event.create!(name: 'Job Interview at Whole Foods',
#               address: '60 Wall street',
#               user_email: 'getmovingapp1@gmail.com',
#               start_time: DateTime.parse('2016-02-22T21:31:46+00:00'),
#               departure_time: DateTime.parse('2016-02-23T17:14:05+00:00'),
#               device_token: "123452357547876868576458674",
#               has_notified: true
#               )

# Event.create!(name: 'Job Interview at PlanetFitness',
#               address: '60 Wall street',
#               user_email: 'getmovingapp1@gmail.com',
#               start_time: DateTime.parse('2016-02-22T21:31:46+00:00'),
#               departure_time: DateTime.parse('2016-02-23T17:14:05+00:00'),
#               device_token: "123455657543476834576458674"
#               )

# Event.create!(name: 'Job Interview at Twitter',
#               address: '60 Wall street',
#               user_email: 'getmovingapp1@gmail.com',
#               start_time: DateTime.parse('2016-02-22T21:31:46+00:00'),
#               departure_time: DateTime.parse('2016-02-22T21:31:46+00:00'),
#               device_token: "123455657547876834576458674"
#               )
