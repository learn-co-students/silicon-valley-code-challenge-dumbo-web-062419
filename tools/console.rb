require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("Apple", "Steve Jobs", "apple.com")
# startup1.pivot("google.com", "Google")
startup2 = Startup.new("Google", "Sergey Brin", "google.com")
Startup.find_by_founder("Steve Jobs")
Startup.domains

vc1 = VentureCapitalist.new("Warren Buffet", 2000000000)
VentureCapitalist.tres_comma_club
vc2 = VentureCapitalist.new("Bill Gates", 3000000000)
vc3 = VentureCapitalist.new("Elon Musk", 4000000)

funding_round1 = FundingRound.new(startup1, vc1, "Angel", 3000.0)

########### Associations and Aggregate methods ###########

funding_round2 = startup1.sign_contract(vc1, "Pre-Seed", 5000.0)
funding_round3 = startup1.sign_contract(vc2, "Seed", 8000.0)
funding_round4 = startup1.sign_contract(vc3, "Series A", 10000.0)

startup1.my_funding_rounds
startup1.num_funding_rounds
startup1.total_funds
startup1.investors
startup1.big_investors

funding_round5 = vc1.offer_contract(startup1, "Series B", 4000)

vc1.funding_rounds
vc1.portfolio
vc1.biggest_investment

binding.pry
0 #leave this here to ensure binding.pry isn't the last line