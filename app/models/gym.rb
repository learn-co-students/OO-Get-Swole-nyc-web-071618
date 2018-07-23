require 'pry'

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
    Membership.all.select{|x| x.gym == self}
  end

  def lifters
    memberships.map{|instance| instance.lifter}
  end

  def lifter_names
    lifters.map{|instance| instance.name}
  end

  def lift_total_for_gym
    count = 0
    memberships.map{|instance| count += instance.lifter.lift_total}
    count
  end




end
