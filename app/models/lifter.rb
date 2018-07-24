
class Lifter


  @@all = []
  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    self.class.all << self
  end


  def self.all
    @@all
  end

  def memberships
    Membership.all.select {|m|m.lifter == self}
  end

  def gyms
    memberships.map{|m| m.gym}
  end

  def self.average_lift
    size = self.all.size
    return 0 if size == 0
    self.all.reduce{|a,b| a.lift_total+b.lift_total}/size
  end

  def sign_up(cost, gym)
    Membership.new(self, gym, cost)
  end

  def total_cost
    memberships.reduce{|a,b| a.cost+b.cost}
  end
end
