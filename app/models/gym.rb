require_relative './lifter'
require_relative './membership'
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
    Membership.all.select {|gyms| @name == self.name}
  end


def lifters
  	memberships.map do |membership|
  		membership.lifter_name
  	end
  end

  def lifter_names
  	lifters.map do |lifter|
  		lifter.name
  	end
  end

  def lift_total_for_gym
    weight = 0
  lifters.each do |lifter|
      weight += lifter.lift_total
    end
    weight
  end
end
