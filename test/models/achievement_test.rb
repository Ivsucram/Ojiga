require 'test_helper'

class AchievementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@achievement = achievements(:one)
  end

  # CRUD C
  test 'should create' do
  	assert_difference('Achievement.count') do
  		Achievement.create(user: users(:good_one), name: 'AchievementName')
  	end
  end

end