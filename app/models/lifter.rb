require_relative './lifter'
require_relative './membership'
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
    Membership.all.select {|gyms| @name == self.name}
  end

    def gyms
      memberships.map do |membership|
    		membership.gym_name
  	end
  end

  def self.average_lift
    total = 0
    self.all.each do |person|
      total +=person.lift_total
  	end
    total = total / self.all.count
  end


  def sign_up(cost, gym)
  	Membership.new(self, gym, cost)
#make a membership using .new and required parameters(self, gym, cost)
  end

  def total_cost
    amount = 0
  	 memberships.each do |membership|
   		amount += membership.cost
     end
     amount

 end
 end
