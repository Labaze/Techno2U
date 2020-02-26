# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'nokogiri'
require 'open-uri'
require 'CSV'

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

url = "https://en.wikipedia.org/wiki/List_of_electronic_music_genres"
list_file = open(url).read
list_doc = Nokogiri::HTML(list_file)

list_doc.search
Genre.create(name: 'House')

puts 'Genres created'
