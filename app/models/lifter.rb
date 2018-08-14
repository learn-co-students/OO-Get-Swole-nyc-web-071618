class Lifter

  @@all = []

  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
      @@all
  end

  def self.lifter_list
      all.map do |lifter|
        lifter.name
    end
  end

  def lifter_membership
     Membership.all.select do |membership|
      membership.lifter == self
    end
  end

  def lifter_gym
    gym_memberships = Membership.all.select do |gym_mem|
      gym_mem.lifter == self
    end
    gym_memberships.map do |gm|
      gm.gym
    end
  end

  def new_membership(cost, gym)
    Membership.new(cost, self, gym)
  end

  def self.lifter_average
    lift_totals = self.all.map do |lifter|
      lifter.lift_total
    end
    binding.pry
    lift_totals.reduce(:+) / lift_totals.count
  end

  def total_cost
    costs = lifter_membership.map do |membership|
      membership.cost
    end
    costs.reduce(:+)
  end

end
