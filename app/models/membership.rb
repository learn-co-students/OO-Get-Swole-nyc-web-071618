class Membership

  @@all = []
  attr_reader :cost, :gym, :lifter

  def initialize(lifter, gym, cost)
    @gym = gym
    @lifter = lifter
    @cost = cost
    self.class.all << self
  end

  def self.all
    @@all
  end
end
