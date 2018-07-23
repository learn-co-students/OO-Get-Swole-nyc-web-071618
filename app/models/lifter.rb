class Lifter

	ALL = []

  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    ALL << self
  end

  def self.all
  	ALL
  end

  def memberships
  	Membership.all.select do |member|
  		member.lifter == self
  	end
  end

  def gyms
  	memberships.collect do |member|
  		member.gym
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
  	 memberships.collect do |membership|
  		amount += membership.cost
     end
     amount
   end

end
