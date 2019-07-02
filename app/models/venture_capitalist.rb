class VentureCapitalist
  attr_accessor :name, :worth
  @@all = []

  def initialize(name, worth)
    @name = name
    @worth = worth
    @@all << self
  end

  def self.all
    @@all
  end

  #returns a number that is the total worth of this investor
  #(e.g., think of it as how much money they have)
  def total_worth
    binding.pry
    # worth = 0
    #iteration
    VentureCapitalist.all.find { |vc| vc.name == inv_name}.worth
#### I will come back to it later
  end

  #returns an array of all venture capitalists in the Trés Commas club
  #(they have more then 1,000,000,000 total_worth)
  def self.tres_commas_club
  end

end
