require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#FundingRound.new(startup, venture_capitalist, type, investment)
#Startup.new(name, founder, domain)
#VentureCapitalist.new(name, total_worth)

startup1 = Startup.new("starter", "L", "domainA")
startup2 = Startup.new("livelive", "Bob", "domainB")
startup3 = Startup.new("rider", "Janet", "domainC")
startup4 = Startup.new("gogogo", "Paul", "domainD")

vc1 = VentureCapitalist.new("Randy", 55000000000.00)
vc2 = VentureCapitalist.new("Kevin", 4399907.00)
vc3 = VentureCapitalist.new("Michael", 565600.00)
vc4 = VentureCapitalist.new("J", 1123000000.00)

fround1 = FundingRound.new(startup1, vc1, "Angel", 1000000000.00)
fround2 = FundingRound.new(startup2, vc2, "Pre-seed", 2000000000.00)
fround3 = FundingRound.new(startup3, vc3, "Seed", 5000000.00)
fround4 = FundingRound.new(startup4, vc4, "SeriesA", 33000000.00)

startup1.sign_contract(vc3, "thetype", 4500.00)
startup1.sign_contract(vc3, "hype", 100.00)
startup1.sign_contract(vc4, "h", 9765870.00)

vc1.offer_contract(startup2, "pre-seed", 123214.00)
vc1.offer_contract(startup2, "seed", 21747484.00)
vc1.offer_contract(startup2, "seed", 84.00)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
