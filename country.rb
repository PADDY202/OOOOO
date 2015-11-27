class Country
  attr_reader :country_code

  def initialize(country_code)
    @country_code = country_code
    @medals = Read_medals.new.readfile
    @gdp = Read_medals.new.read_gdp
  end

  def to_s
    "#{@country_code}, #{@medals[@country_code][0]}, #{@medals[@country_code][1]}, #{@medals[@country_code][2]}, #{@medals[@country_code][3]}"

  end

  def get_gold
    @medals[@country_code][0]
  end

  def get_pop
    @medals[@country_code][3]
  end
  def score
    (3*@medals[@country_code][0] + 2*@medals[@country_code][1] + @medals[@country_code][2]).to_f / @gdp[@country_code][0]
  end



end

class MedalRankings
  def initialize(countryarray)
   @countries = countryarray
  end

  def to_s(n)
    n_array = @countries.first(n)
    n_string = n_array.map { |i| " " +i.to_s }.join(",")
     n_string
  end

  def most_golds
    most_gold = 0
    country_most_golds = Country
    @countries.each { |x|
      if x.get_gold > most_gold
    most_gold = x.get_gold
    country_most_golds = x
    end }
    country_most_golds
  end

  def average_pop
    pop_sum = 0
    @countries.each { |x|  pop_sum += x.get_pop  }
    average = pop_sum/ @countries.size
     average
  end

  def get_scores
    @countries.each { |x| puts x.score }
  end

  def sort!
    country_score =Hash.new
    @countries.each { |x| country_score[x.country_code] = x.score }
    country_score_ordered = country_score.sort_by { |c, scre| scre }.reverse    #sorts by score
    country_score_ordered.each_with_index { |x, index| @countries[index]=Country.new(x[0]) }
     @countries
  end

  def each_single_gold_winner
    one_gold_country = []
    @countries.each { |x| if x.get_gold==1
                            one_gold_country << x
                          end }
    one_gold_country

  end
end




