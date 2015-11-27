class Read_medals
  def initialize

  end
  def readfile
    hsh =Hash.new                                    #hash function with country abbrev as key as values the medals and population stored in the order they were in the file
     File.readlines('medals.txt').each do |line|
      key , values = line.chomp.split(' ', 2)     #splits the string line into 2 parts using the ' ' as the deliminator
      values = values.split.map(&:to_i)           #converts the array of strings to an array of ints
      hsh[key] = values
     end
   return hsh
  end
def read_gdp
  hsh =Hash.new                                    #hash function with country abbrev as key as values the medals and population stored in the order they were in the file
  File.readlines('gdp.txt').each do |line|
    key , values = line.chomp.split(' ', 2)     #splits the string line into 2 parts using the ' ' as the deliminator
    values = values.split.map(&:to_i)           #converts the array of strings to an array of ints
    hsh[key] = values
  end
  return hsh
end
end

