require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("Startup1", "dotcom", "tom")
startup2 = Startup.new("Startup2", "dotnet", "ayana")
startup3 = Startup.new("Startup3", "dotaol", "tony")
startup4 = Startup.new("Startup4", "appleaol", "annie")
startup5 = Startup.new("Startup5", "appleaol", "sam")

vc1 = VentureCapitalist.new("VC1", 1)
vc2 = VentureCapitalist.new("VC2", 2)
vc3 = VentureCapitalist.new("VC3", 3)
vc4 = VentureCapitalist.new("VC4", 4)

fr1 = FundingRound.new(startup1, vc1, "Angel", 1)
fr2 = FundingRound.new(startup2, vc2, "Pre-Seed", 2)
fr3 = FundingRound.new(startup3, vc1, "Seed", 3)
fr4 = FundingRound.new(startup4, vc4, "Series A", 4)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
