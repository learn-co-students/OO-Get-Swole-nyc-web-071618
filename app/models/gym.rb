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
  	Membership.all.select do |membership|
      #calling Class Membership, method (all)
  		membership.gym == self
  	end
  end

  def lifters
  	memberships.collect do |membership|
  		membership.lifter
  	end
  end

  def lifter_names
  	lifters.collect do |lifter|
  		lifter.name
  	end
  end

  def lift_total_for_gym
    weight = 0
    lifters.each do |member|
      weight += member.lift_total
  end
  weight
end

end
