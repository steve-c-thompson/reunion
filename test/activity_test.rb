require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_it_exists
    activity = Activity.new("ActivityName", 30.0, 5.0)
    assert_instance_of Activity, activity
  end

  def test_activity_has_a_name
    activity = Activity.new("ActivityName", 30.0, 5.0)
    assert_equal "ActivityName", activity.name
  end

  def test_activity_has_empty_participant_hash
    activity = Activity.new("ActivityName", 30.0, 5.0)
    assert_instance_of Hash, activity.participants
    assert_equal 0, activity.participants.count
  end

  def test_it_can_add_participants
    activity = Activity.new("ActivityName", 30.0, 5.0)
    activity.add_participant("Dave")
    activity.add_participant("Ron")

    participants = activity.participants
    assert_equal 2, participants.count
    assert participants.include?(:Dave)
    assert participants.include?(:Ron)
  end

  def test_activity_has_participants_as_hash_with_name_and_amount_paid
    activity = Activity.new("ActivityName", 30.0, 5.0)
    activity.add_participant("Dave")
    activity.add_participant("Ron")

    participants = activity.participants
    assert_equal 2, participants.count
    dave_money = participants[:Dave]
    assert_equal 0.0, dave_money
    ron_money = participants[:Ron]
    assert_equal 0.0, ron_money
  end

  def test_activity_has_base_cost
    activity = Activity.new("ActivityName", 30.0, 5.0)
    assert_equal 30.0, activity.base_cost
  end

  def test_activity_has_cost_per_participant
    activity = Activity.new("ActivityName", 30.0, 5.0)
    assert_equal 5.0, activity.cost_per_participant
  end

  def test_it_can_evaluate_total_cost
    activity = Activity.new("ActivityName", 30.0, 5.0)
    activity.add_participant("Dave")
    activity.add_participant("Ron")

    assert_equal 40.0, activity.evaluate_total_cost
  end
end
