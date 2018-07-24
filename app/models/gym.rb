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

  def memberships
    Membership.all.select{|membership|
      membership.gym == self
    }
  end

  def lifters
    self.memberships.map{|m|
      m.lifter
    }
  end

  def lifter_names
    self.lifters.map{|lifter|
      lifter.name
    }
  end

  def lift_total_for_gym
    self.lifters.reduce{|a,b|
      a.lift_total+b.lift_total
    }
  end
end
