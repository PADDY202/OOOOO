require 'test/unit'
require_relative 'read_medals'
require_relative 'country'
class MyTest < Test::Unit::TestCase

  def setup
   @read = Read_medals.new()
   @country = Country.new('IRL')
 end

  def test_readfile
   assert_equal(Hash, @read.readfile.class)   #Check that Hash is created
   assert_equal(false, @read.readfile.empty?) #Not empty
   assert_equal(Hash, @read.read_gdp.class)   #Check that Hash is created
   assert_equal(false, @read.read_gdp.empty?) #Not empty
  end

  def test_Country

   assert_equal(Fixnum, @country.get_gold.class)
   assert_equal(Float, @country.score.class)
   assert_equal(String, @country.to_s.class)#Check to_s returns a String
   assert_equal(String, @country.country_code.class)#Check attr_accessor returns a String

  end
 def test_MedalRankings
  array =[]
  ele2 = Country.new('BIH')
  array = [@country,ele2]
  country_array =MedalRankings.new(array)
  assert_equal(String ,country_array.to_s(2).class)#Test String was created
  assert_equal(Country, country_array.most_golds.class)
  assert_equal(Fixnum, country_array.average_pop.class)
  assert_equal(Array, country_array.sort!.class)#returns an array of countries
 end
  def test_most_golds
  end
end