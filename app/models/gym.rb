class Gym

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def gyms
    Gym.all.map {|gym| gym}
  end

  def memberships
    Membership.all.select {|membership|membership.gym == self}
  end

  def lifters
    memberships.map {|membership|membership.lifter}
  end

  def lifter_names
    lifters.map {|lifter|lifter.name}
  end

  def lift_total_for_gym
    lift_total_array = lifters.map {|lifter|lifter.lift_total}
    lift_total_array.reduce(:+)
  end

end # end of Gym class
