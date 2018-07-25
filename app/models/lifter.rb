
class Lifter

  attr_reader :name, :lift_total

  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships #returns an array of all memberships of that lifter
    Membership.all.select do |membership|
      self == membership.lifters
    end
  end

  def gyms
    memberships.map do |membership|
      membership.gym
    end
  end

  def self.average_lift #returns the average lift_total of all lifters
    grand_total = 0
    self.all.each do |lifter|
      grand_total += lifter.lift_total
    end
    average = grand_total / self.all.count
    average
  end

  def sign_up(cost, gym)
    # sharon.sign_up(200, lifetime) #associates a lifter and gyms
    Membership.new(self, gym, cost)
  end

  def total_cost
    total = 0
    memberships.each do |membership|
      total += membership.cost
    end
    total
  end




end
