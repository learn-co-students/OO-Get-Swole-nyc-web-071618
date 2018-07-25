require 'pry'

class Gym
 @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships #returns an array of all of that gym's memberships
    Membership.all.select do |membership| #matching names of instances of memberships with gym name
      self == membership.gym #SELECT because you're picking out each person
    end
  end

  def lifters # returns and array of all of that gym's lifters
    memberships.map do |membership|
      membership.lifters #MAP because you're taking the same number of people
    end
  end

  def lifter_names
    lifters.map do |lifter|
      lifter.name
    end
  end

  def lift_total_for_gym
    total = 0
    lifters.each do |lifter|
      total += lifter.lift_total
    end
    total
  end

end
