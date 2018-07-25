class Membership


  attr_reader :cost
  attr_accessor :gym, :lifter

  @@all = []

  def initialize(lifter, gym, cost)
    @cost = cost
    @gym = gym
    @lifter = lifter
    @@all << self
  end

  def self.all
    @@all
  end

end
