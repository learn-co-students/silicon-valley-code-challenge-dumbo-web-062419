class Startup

    attr_accessor :name, :domain
    attr_reader :founder

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

    def pivot(domain,name)
        @domain = domain
        @name = name
    end

    def self.find_by_founder(founder)
        @@all.find { |startup| startup.founder == founder }
    end

    def self.domains
        @@all.map { |startup| startup.domain }
    end

    ########## Associations and Aggregate Methods ##########
    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self,venture_capitalist,type,investment)
    end

    # Helper method
    def my_funding_rounds
        FundingRound.all.select { |funding_round| funding_round.startup == self }
    end

    def num_funding_rounds
        my_funding_rounds.length
    end

    def total_funds
        total_count = 0
        my_funding_rounds.each { |funding_round| total_count += funding_round.investment }
        total_count
    end

    def investors
        all_investors = my_funding_rounds.map { |funding_round| funding_round.venture_capitalist }
        all_investors.uniq
    end

    def big_investors
        tres_comma_club = VentureCapitalist.tres_comma_club
        all_investors = investors
        all_big_investors = tres_comma_club & all_investors
        all_big_investors.uniq
    end

end
