class Startup
  attr_accessor :name, :domain, :founder
  @@all = []

  def initialize(name, domain, founder)
    @name = name
    @domain = domain
    @founder = founder
    @@all << self
  end

  def self.all
    @@all
  end

  ##given a string of a domain and a string of
  ##a name, change the domain and name of the startup
  def pivot(new_domain, new_name)
    self.domain = new_domain
    self.name = new_name
  end

  def self.find_by_founder(founder)
    Startup.all.find { |startup_element| startup_element.founder == founder }
  end
  ##we think it works! pry: Startup.find_by_founder("tom")
  ## we are accessing vc model - how?
  ## we need to access founder's name.
  ##questions: I am not sure how to check this method. how do I assign a variable to founder?
  def self.domains
    Startup.all.map { |startup| startup.domain }.uniq
  end
    ##should return an array of all of the different startup domains in the same dimention as we have requested
    ##select needs a Boolean condition
    ##

end
