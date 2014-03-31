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

end