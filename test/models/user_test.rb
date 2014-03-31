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

  # CRUD R
  test 'should read' do
    assert(User.first == @user, 'User.first expected to be good_one from yaml')
    user = User.create(name: 'MyNameTest2', nick: 'MyNickTest2', email: 'MyEmailTest2@email.com', password: 'MyPasswordTest', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    assert(User.last == user)
  end

  # CRUD U
  test 'should update' do
    user = User.create(name: 'MyNameTest3', nick: 'MyNickTest3', email: 'MyEmailTest3@email.com', password: 'MyPasswordTest', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    assert(user.name == 'MyNameTest3')
    user.name = 'MyNameTest4'
    user.save
    assert(!user.changed?, 'user was not saved')
    assert(user.name == 'MyNameTest4')
  end

  # CRUD D
  test 'should delete' do
    assert_difference('User.count', -1) do
      User.first.delete
    end
  end

end
