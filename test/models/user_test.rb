require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@user = users(:good_one)
  end

  # CRUD C
  test 'should create' do
  	assert_difference('User.count') do
  		User.create(name: 'MyNameTest', nick: 'MyNickTest', email: 'MyEmailTest@email.com', password: 'MyPasswordTest', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
  	end
  end

end
