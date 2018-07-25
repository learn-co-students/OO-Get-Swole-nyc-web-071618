
class Gym
 ALL = []

  attr_reader :name

  def initialize(name)
    @name = name
    ALL << self

  end

  def self.all
    ALL
  end

# eturns an array of all of that gym's memberships
  def memberships
    Membership.all.select do |membership|
      if membership.gym == self
        membership.lifter
      end
    end
  end

# returns and array of all of that gym's lifters
  def lifters
    self.memberships.map do |membership|
      membership.lifter
    end
  end
    
# returns an array of all the names of that gym's lifters
    def lifter_names
      self.lifters.map do |lifter|
        lifter.name
      end
    end

# returns a sum of lift_totals for all the lifters at that gym
  def lift_total_for_gym
    lifter_total = 0
    self.lifters.map do |lifter|
      lifter_total += lifter.lift_total
    end
    lifter_total
  end


end
