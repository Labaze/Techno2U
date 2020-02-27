# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroy all the database'

Party.destroy_all
User.destroy_all
Attending.destroy_all
Artist.destroy_all
Lineup.destroy_all
Genre.destroy_all
Preference.destroy_all

puts 'Database clean'

# Seeding Genres
puts 'Creating genres'

ambient                = Genre.create!(name: 'Ambient')
breakbeat              = Genre.create!(name: 'Breakbeat')
disco                  = Genre.create!(name: 'Disco')
downtempo              = Genre.create!(name: 'Downtempo')
dnb                    = Genre.create!(name: 'Drum and bass')
dub                    = Genre.create!(name: 'Dub')
electro                = Genre.create!(name: 'Electro')
electroacoustique      = Genre.create!(name: 'Musique électroacoustique')
trap                   = Genre.create!(name: 'Trap')
rock_electronique      = Genre.create!(name: 'Rock électronique')
electronica            = Genre.create!(name: 'Electronica')
techno_hardcore_gabber = Genre.create!(name: 'Techno hardcore/Gabber')
hardstyle              = Genre.create!(name: 'Hardstyle')
hinrg                  = Genre.create!(name: 'Hi-NRG')
house                  = Genre.create!(name: 'House Music')
indus                  = Genre.create!(name: 'Musique industrielle')
idm                    = Genre.create!(name: 'IDM')
jungle                 = Genre.create!(name: 'Jungle')
post_disco             = Genre.create!(name: 'Post-disco')
techno                 = Genre.create!(name: 'Techno')
trance                 = Genre.create!(name: 'Trance')
uk_garage              = Genre.create!(name: 'UK garage')
game_music             = Genre.create!(name: 'Musique de jeu vidéo')

puts 'Genres created from wikipedia list (no scrapping). Type Genre.all in console to check the styles created'



puts 'Creating Artists'

ResidentAdvisor.scrapping_artists_top_1000

puts 'Artists created from RA top 1000 (scrapping)'



puts 'Creating Parties in Berlin, with associated lineups and artists'

ResidentAdvisor.scrapping_parties('berlin', 'week', '2020-03-02')

puts 'Parties created from RA list (scrapping)'



puts 'Creating users'

marc     = User.create!(name:'MarcoFullStack',  email:'marc.combarel@edhec.com',   password:'azerty')
augustin = User.create!(name:'Dourtealacreme',  email:'augustin.dortu@edhec.com',  password:'azerty')
pierre   = User.create!(name:'Pedro',           email:'pierre.debilbao@edhec.com', password:'azerty')
basile   = User.create!(name:'DJBaz',           email:'basile.masson@edhec.com',   password:'azerty')
ricardo  = User.create!(name:'Ricardo',         email:'ricardo@test.com',          password:'azerty')
carl     = User.create!(name:'Carl Cox',        email:'carl@test.com',             password:'azerty')
octave   = User.create!(name:'Octave One',      email:'octave@test.com',           password:'azerty')
giorgo   = User.create!(name:'Giorgo',          email:'giorgo@test.com',           password:'azerty')
nastia   = User.create!(name:'Nastia',          email:'nastia@test.com',           password:'azerty')
paul     = User.create!(name:'Paul Johnson',    email:'johnson@test.com',          password:'azerty')
ben      = User.create!(name:'Ben Clock',       email:'ben@test.com',              password:'azerty')
henry    = User.create!(name:'Henry',           email:'henry@test.com',            password:'azerty')
lee      = User.create!(name:'Lee Burridge',    email:'lee@test.com',              password:'azerty')
maceo    = User.create!(name:'Maceo Plew',      email:'maceo@test.com',            password:'azerty')
jacques  = User.create!(name:'Jacques',         email:'jacques@test.com',          password:'azerty')
daft     = User.create!(name:'Daft Punk',       email:'daftpunk@test.com',         password:'azerty')
azf      = User.create!(name:'DJ AZF',          email:'azf@test.com',              password:'azerty')
lolo     = User.create!(name:'Laurent Garnier', email:'garnier@test.com',          password:'azerty')
seth     = User.create!(name:'Seth Troxler',    email:'batman@test.com',           password:'azerty')
move     = User.create!(name:'Move D',          email:'moved@test.com',            password:'azerty')
stingray = User.create!(name:'DJ Stingray',     email:'stingray@test.com',         password:'azerty')
kerry    = User.create!(name:'Kerry Chandler',  email:'kerrychandler@test.com',    password:'azerty')

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
