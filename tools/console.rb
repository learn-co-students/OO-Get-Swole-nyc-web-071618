require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

david = Lifter.new("David", 150)
muscle = Lifter.new("muscle", 670)
wangtron = Lifter.new("wangtron", 1500)

pf = Gym.new("Planet Fitness")
nysc = Gym.new("New York Sports Club")
rise = Gym.new("Rise")

num1 = Membership.new(10, david, pf)
num2 = Membership.new(60, muscle, nysc)
num3 = Membership.new(100, wangtron, rise)
binding.pry
0
