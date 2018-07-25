require "pry"

class Lifter


  attr_reader :name
  attr_accessor :lift_total

  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all 
    @@all
  end

  def memberships
    Membership.all.select do |membership|
      membership.lifter == self
    end
  end

  def gyms
    memberships.map do |membership|
      membership.gym
    end
  end

  def self.average_lift
    lift_sum = 0
    self.all.each do |lifter|
      lift_sum += lifter.lift_total
    end 
    lift_sum / self.all.size
  end

  def sign_up(cost, gym)
    # gym = Gym.new(name)
    Membership.new(self, gym, cost)
  end

  def total_cost
    membership_total = 0
    memberships.each do |membership|
      membership_total += membership.cost
    end
    membership_total
  end





end
