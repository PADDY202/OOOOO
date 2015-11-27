require_relative 'Read_medals'
require_relative 'Country'

class Main
  read = Read_medals.new()
  hash = read.readfile
  array = hash.keys
  country_names=[]
  array.each {|x| country_names<<x }
  countries=[]
  country_names.each {|x| countries<<Country.new(x) }
  every_country = MedalRankings.new(countries)
  puts("The country with the most gold medals:")
  puts every_country.most_golds
  puts ("The average population of all the countries:")
  puts every_country.average_pop
  puts ("The top 10 countries sorted by score:")
  puts every_country.sort!.first(10)
  puts("All the single gold medal winners in alphabetical order: ")
  puts every_country.each_single_gold_winner.sort_by{|i| i.country_code}
  end