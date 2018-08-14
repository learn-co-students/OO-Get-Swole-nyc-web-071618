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

  def memberships
    Membership.all.select do |mems|
      mems.gym == self
    end
  end

  def lifters
    memberships.map do |membership|
      membership.lifter
    end
  end

  def lifter_names
    lifters.map do |lifter|
      lifter.name
    end
  end

  def lift_totals
    lift_totals = lifters.map do |lifter|
      lifter.lift_total
    end
    binding.pry
    lift_totals.reduce(:+)
  end

end #end of class
