require 'pry'
require_relative './membership.rb'
require_relative './gym.rb'

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

  def memberships
    Membership.all.select{|mem| mem.lifter == self}
  end

  def gyms
    memberships.map{|mem| mem.gym}
  end

  def self.total_lift
    self.all.map{|lifter| lifter.lift_total}
  end

  def self.average_lift
    self.total_lift.inject(:+) / self.all.count
  end

  def sign_up(cost, gym)
    Membership.new(self, gym, cost)
  end

  def total_cost
    memberships.map{|mem| mem.cost}.inject(:+)
  end

end
