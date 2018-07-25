class Membership


@@all_memberships = []
  attr_reader :cost, :lifter_name, :gym_name

  def initialize(lifter_name, gym_name, cost)
    @cost = cost
    @lifter_name = lifter_name
    @gym_name = gym_name
    @@all_memberships << self
  end

  def self.all
    @@all_memberships
  end

end
