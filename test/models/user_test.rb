require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "user should enter a nonempty first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "user should enter a nonempty last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "user should enter a nonempty profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "user should have a unique profile name" do
  	user = User.new
  	user.profile_name = users(:RandomUser).profile_name

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "user should have a profile name without spaces" do
  	user = User.new
  	user.profile_name = "this is not valid"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Format your profile name correctly or else you cannot use the best app ever!")
  end

end
