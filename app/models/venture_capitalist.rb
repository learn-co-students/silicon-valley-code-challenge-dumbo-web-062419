class VentureCapitalist

    attr_accessor :total_worth
    attr_reader :name

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_comma_club
        @@all.select { |vc| vc.total_worth > 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select { |funding_round| funding_round.venture_capitalist == self }
    end

    def portfolio
        all_my_startups = funding_rounds.map { |funding_round| funding_round.startup }
        all_my_startups.uniq
    end

    def biggest_investment
        # biggest_funding_round = funding_rounds[0]
        # funding_rounds.each do |funding_round|
        #     if funding_round.investment > biggest_funding_round.investment
        #         biggest_funding_round = funding_round
        #     end
        # end
        # biggest_funding_round

        # Credits to Laurell
        sorted = self.funding_rounds.sort_by(&:investment)
        sorted[-1]
      
    end

    def invested(domain)
        total = 0

        funding_rounds_with_domain = funding_rounds.select { |funding_round| funding_round.startup.domain == domain }

        funding_rounds_with_domain.each { |funding_round_with_domain| total += funding_round_with_domain.investment }

        total
    end

end
