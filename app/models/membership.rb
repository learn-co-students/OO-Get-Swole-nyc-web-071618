require 'pry'
require_relative './lifter.rb'
require_relative './gym.rb'

class Membership

  attr_reader :cost, :lifter, :gym
  @@all = []

  def initialize(lifter, gym, cost)
    @lifter = lifter
    @gym = gym
    @cost = cost
    @@all << self
  end

  def self.all
    @@all
  end

end
