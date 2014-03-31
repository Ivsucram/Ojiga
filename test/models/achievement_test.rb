require 'test_helper'

class AchievementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@user = users(:good_one)
  	#TODO Configure the fixture for achievement that load a User from the DB
  	@achievement = Achievement.create(user: @user, name: 'AchievementName')
  end

  # CRUD C
  test 'should create' do
  	assert_difference('Achievement.count') do
  		Achievement.create(user: @user, name: 'AchievementName')
  	end
  end

  # CRUD R
  test 'should read' do
  	assert(Achievement.first == @achievement)
  	achievement = Achievement.create(user: @user, name: 'AchievementName2')
  	assert(Achievement.last == achievement)
  end

  # CRUD U
  test 'should update' do
  	achievement = Achievement.create(user: @user, name: 'AchievementNameOld')
  	assert(achievement.name == 'AchievementNameOld')
  	achievement.name = 'AchievementNameNew'
  	achievement.save
  	assert(!achievement.changed?)
  	assert(achievement.name == 'AchievementNameNew')
  end

  # CRUD D
  test 'should delete' do
  	assert_difference('Achievement.count', -1) do
  		Achievement.first.delete
  	end
  end

  test 'validates field user' do
  	# Validates presence
  	achievement = Achievement.new(name: 'AchievementName')
  	assert !achievement.save

  	# Validates happy route
  	assert_difference('Achievement.count') do
  		Achievement.create(user: @user, name: 'AchievementName')
  	end
  end

  test 'validates field name' do
  	# Validates presence
  	achievement = Achievement.new(user: @user)
  	assert !achievement.save

  	# Validates length
	achievement = Achievement.new(user: @user, name: '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901')
  	assert !achievement.save

  	# Validates happy route
  	assert_difference('Achievement.count') do
  		Achievement.create(user: @user, name: '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890')
  	end
  end
 
end