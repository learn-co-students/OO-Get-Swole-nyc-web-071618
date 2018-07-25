require 'pry'
require_relative './membership.rb'
require_relative './lifter.rb'

class Gym

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select{|mem| mem.gym == self}
  end

  def lifters
    memberships.map{|mem| mem.lifter}
  end

  def lifter_names
    lifters.map{|lifter| lifter.name}
  end

  def lift_total_for_gym
    lifters.map{|lifter| lifter.lift_total}.inject(:+)
  end

end
