require 'pry'
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
    Membership.all.select{|x| x.lifter == self}
  end

  def gyms
    memberships.map{|instance| instance.gym}
  end

  def self.average_lift
    count = 0
    self.all.map{|instance| count += instance.lift_total}
    count/@@all.count
  end

  def sign_up(cost, gym)
    #^spect format bottom is the Membership format
    Membership.new(self, gym, cost)
  end

  def total_cost
    count = 0
    memberships.map{|instance| count += instance.cost}
    count
  end






end
