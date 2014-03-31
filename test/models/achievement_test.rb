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
  test 'shuold read' do
  	assert(Achievement.first == @achievement)
  	achievement = Achievement.create(user: @user, name: 'AchievementName2')
  	assert(Achievement.last == achievement)
  end

end