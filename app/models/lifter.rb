require 'pry'

class Lifter

  attr_reader :name, :lift_total

  @@all = []

  def initialize(name,lift_total)
    @name = name
    @lift_total = lift_total
    self.class.all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select{|membership| membership.lifter == self}
  end

  def gyms
    memberships.map {|membership| membership.gym}
  end

  def self.average_lift
    lift_totals_array = Lifter.all.map {|lifter|lifter.lift_total}
    totals_sum = lift_totals_array.reduce(:+)
    divisor = Lifter.all.size
    average = totals_sum / divisor
  end

  def sign_up(cost,gym)
    Membership.new(self,gym,cost)
  end

  def total_cost
    costs_array = memberships.map {|membership| membership.cost}
    costs_array.reduce(:+)
  end

end # end of Lifter class
