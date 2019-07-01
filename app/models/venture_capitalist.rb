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
        biggest_funding_round = funding_rounds[0]
        funding_rounds.each do |funding_round|
            if funding_round.investment > biggest_funding_round.investment
                biggest_funding_round = funding_round
            end
        end
        biggest_funding_round
    end

end
