# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Destroy all the database'

# Party.destroy_all
# Artist.destroy_all
# Lineup.destroy_all
Preference.destroy_all
Attending.destroy_all
Genre.destroy_all
User.destroy_all

puts 'Database clean'



puts 'Creating genres'

rnb                      =          Genre.create!(name: 'RnB')
rap                      =          Genre.create!(name: 'Rap')
electronic               =          Genre.create!(name: 'Electronic')
newage                   =          Genre.create!(name: 'New Age')
classical                =          Genre.create!(name: 'Classical')
reggae                   =          Genre.create!(name: 'Reggae')
blues                    =          Genre.create!(name: 'Blues')
country                  =          Genre.create!(name: 'Country')
world                    =          Genre.create!(name: 'World')
folk                     =          Genre.create!(name: 'Folk')
techno                   =          Genre.create!(name: 'Techno')
jazz                     =          Genre.create!(name: 'Jazz')
house                    =          Genre.create!(name: 'House')
alternative              =          Genre.create!(name: 'Alternative')
pop                      =          Genre.create!(name: 'Pop')
heavymetal               =          Genre.create!(name: 'Heavy Metal')

puts 'Genres created from wikipedia list (no scrapping). Type Genre.all in console to check the styles created'



puts 'Creating Unknown artist'
Artist.create!(name: 'Unknown')
puts 'Unknown artist created'

# puts 'Creating Artists'

# ResidentAdvisor.scrapping_artists_top_1000

# puts 'Artists created from RA top 1000 (scrapping)'



# puts 'Creating Parties by rake task + background job'

# ResidentAdvisor.scrapping_parties("de", "berlin",    "week", '2020-03-01')
# ResidentAdvisor.scrapping_parties("fr", "paris",     "week", '2020-03-01')
# ResidentAdvisor.scrapping_parties("uk", "london",    "week", '2020-03-01')
# ResidentAdvisor.scrapping_parties("it", "rome",      "week", '2020-03-01')
# ResidentAdvisor.scrapping_parties("nl", "amsterdam", "week", '2020-03-01')
# ResidentAdvisor.scrapping_parties("us", "newyork",   "day", '2020-03-07')
# ResidentAdvisor.scrapping_parties("jp", "tokyo",     "week", '2020-03-01')


# puts 'Parties created from RA list (scrapping)'



puts 'Creating users'

marc     = User.create!(name:'MarcoFullStack',  email:'marc@test.com',          password:'azerty', admin: true)
augustin = User.create!(name:'Dourtealacreme',  email:'augustin@test.com',      password:'azerty', admin: true)
pierre   = User.create!(name:'Pedro',           email:'pierre@test.com',        password:'azerty', admin: true)
basile   = User.create!(name:'DJBaz',           email:'basile@test.com',        password:'azerty', admin: true)
ricardo  = User.create!(name:'Ricardo',         email:'ricardo@test.com',       password:'azerty')
carl     = User.create!(name:'Carl Cox',        email:'carl@test.com',          password:'azerty')
octave   = User.create!(name:'Octave One',      email:'octave@test.com',        password:'azerty')
giorgo   = User.create!(name:'Giorgo',          email:'giorgo@test.com',        password:'azerty')
nastia   = User.create!(name:'Nastia',          email:'nastia@test.com',        password:'azerty')
paul     = User.create!(name:'Paul Johnson',    email:'johnson@test.com',       password:'azerty')
ben      = User.create!(name:'Ben Clock',       email:'ben@test.com',           password:'azerty')
henry    = User.create!(name:'Henry',           email:'henry@test.com',         password:'azerty')
lee      = User.create!(name:'Lee Burridge',    email:'lee@test.com',           password:'azerty')
maceo    = User.create!(name:'Maceo Plew',      email:'maceo@test.com',         password:'azerty')
jacques  = User.create!(name:'Jacques',         email:'jacques@test.com',       password:'azerty')
daft     = User.create!(name:'Daft Punk',       email:'daftpunk@test.com',      password:'azerty')
azf      = User.create!(name:'DJ AZF',          email:'azf@test.com',           password:'azerty')
lolo     = User.create!(name:'Laurent Garnier', email:'garnier@test.com',       password:'azerty')
seth     = User.create!(name:'Seth Troxler',    email:'batman@test.com',        password:'azerty')
move     = User.create!(name:'Move D',          email:'moved@test.com',         password:'azerty')
stingray = User.create!(name:'DJ Stingray',     email:'stingray@test.com',      password:'azerty')
kerry    = User.create!(name:'Kerry Chandler',  email:'kerrychandler@test.com', password:'azerty')

puts 'Users created'



puts 'Creating attendings'

User.all.each do |user|
  attending = Attending.new
  attending.user = user
  party_id = rand(Party.first.id..Party.last.id)
  attending.party = Party.find(party_id)
  attending.save!
end

puts 'Attendings created'



puts 'Creating preferences'

User.all.each do |user|
  5.times do
    preference = Preference.new
    preference.user = user
    artist_id = rand(Artist.first.id..Artist.last.id)
    preference.artist = Artist.find(artist_id)
    preference.save!
  end
end

puts 'Preferences created'
