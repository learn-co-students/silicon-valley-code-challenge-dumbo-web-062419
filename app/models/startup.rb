class Startup
  attr_reader :founder
  attr_accessor :name, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain

    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(domain, name)
    self.domain = domain
    self.name = name
    self
  end

  def self.find_by_founder(name)
    @@all.find do |startup|
      if startup.founder == name
        startup
      end
    end
  end

  def self.domains
    @@all.map do |startup|
      startup.domain
    end
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def num_funding_rounds
    counter = 0
    FundingRound.all.select do |fr|
      if fr.startup == self
        counter += 1
      end
    end
    counter
  end

  def total_funds
    total = 0
    FundingRound.all.select do |fr|
      if fr.startup == self
        total += fr.investment
      end
    end
    total
  end

  def investors
    uniq_investors = []
    FundingRound.all.select do |fr|
      if fr.startup == self
        uniq_investors << fr.venture_capitalist
      end
    end
    uniq_investors.uniq
  end

  def big_investors
    top_investors = []
    self.investors.select do |investor|
      if VentureCapitalist.tres_commas_club.include?(investor)
        top_investors << investor
      end
    end
    top_investors.uniq
  end

end
