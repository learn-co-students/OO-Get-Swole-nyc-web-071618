class Membership


  attr_reader :cost, :gym, :lifters

  @@all = []

  def initialize(lifters, gym, cost)
    @cost = cost
    @gym = gym
    @lifters = lifters
    @@all << self
  end

  def self.all
    @@all
  end



end
