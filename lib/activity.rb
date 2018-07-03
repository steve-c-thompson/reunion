class Activity
  attr_reader :name
  attr_reader :base_cost
  attr_reader :cost_per_participant
  attr_reader :participants

  def initialize(name, base_cost, cost_per_participant)
    @name = name
    @base_cost = base_cost
    @cost_per_participant = cost_per_participant
    @participants = {}
  end

  def add_participant(participant)
    @participants[participant.to_sym] = 0.0
  end

  def evaluate_total_cost
    @participants.count * @cost_per_participant + @base_cost
  end
end
