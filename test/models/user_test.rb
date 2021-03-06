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
  test 'should retrieve' do
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

  test 'validates field name' do
    # Validates presence
    user = User.new(nick: 'MyNickTest', email: 'MyEmailTest@email.com', password: 'MyPasswordTest', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    assert !user.save

    # Validates length
    user = User.new(name: '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901', nick: 'MyNickTest', email: 'MyEmailTest@email.com', password: 'MyPasswordTest', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    assert !user.save

    # Validates happy route
    assert_difference('User.count') do
      User.create(name: '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890', nick: 'MyNickTest', email: 'MyEmailTest@email.com', password: 'MyPasswordTest', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    end
  end

  test 'validates field nick' do
    # Validates allow_nil
    assert_difference('User.count') do
      User.create(name: 'MyNameTest', email: 'MyEmailTest@email.com', password: 'MyPasswordTest', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    end
    # Validates uniqueness
    user = User.new(name: 'MyNameTest', nick: User.first.nick, email: 'MyEmailTest@email.com', password: 'MyPasswordTest', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    assert !user.save

    # Validates length
    user = User.new(name: 'MyNameTest', nick: '1234567890123456789012345678901', email: 'MyEmailTest@email.com', password: 'MyPasswordTest', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    assert !user.save

    # Validates happy route
    assert_difference('User.count') do
      User.create(name: 'MyNameTest', nick: '123456789012345678901234567890', email: 'MyEmailTest@email.com', password: 'MyPasswordTest', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    end
  end

  test 'validates field email' do
    # Validates presense
    user = User.new(name: 'MyNameTest', nick: 'MyNickTest', password: 'MyPasswordTest', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    assert !user.save

    # Validates uniqueness
    user = User.new(name: 'MyNameTest', nick: 'MyNickTest', email: User.first.email, password: 'MyPasswordTest', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    assert !user.save

    # Validates length
    user = User.new(name: 'MyNameTest', nick: 'MyNickTest', email: '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901@email.com', password: 'MyPasswordTest', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    assert !user.save

    # Validates happy route
    assert_difference('User.count') do
      User.create(name: 'MyNameTest', nick: 'MyNickTest', email: '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890@email.com', password: 'MyPasswordTest', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    end
  end

  test 'validates field password' do
    # Validates presence
    user = User.new(name: 'MyNameTest', nick: 'MyNickTest', email: 'MyEmailTest@email.com', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    assert !user.save

    # Validates length
    user = User.new(name: 'MyNameTest', nick: 'MyNickTest', email: 'MyEmailTest@email.com', password: '123456789012345678901234567890123456789012345678901', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    assert !user.save

    # Validates happy route
    assert_difference('User.count') do
      User.create(name: 'MyNameTest', nick: 'MyNickTest', email: 'MyEmailTest@email.com', password: '12345678901234567890123456789012345678901234567890', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    end
  end

  #TODO validates field picture

  test 'validates field birthday' do
    # Validates presence
    user = User.new(name: 'MyNameTest', nick: 'MyNickTest', email: 'MyEmailTest@email.com', password: 'MyPasswordTest', picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    assert !user.save

    # Validates happy route
    assert_difference('User.count') do
      User.create(name: 'MyNameTest', nick: 'MyNickTest', email: 'MyEmailTest@email.com', password: 'MyPasswordTest', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    end
  end

  #TODO validates field isTermConditionsChecked

  test 'validates cannot_be_future_date' do
    user = User.new(name: 'MyNameTest', nick: 'MyNickTest', email: 'MyEmailTest@email.com', password: 'MyPasswordTest', birthday: Date.today+1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
    assert !user.save
  end

  test 'after validation downcase_email' do
    assert_difference('User.count') do
      user = User.create(name: 'MyNameTest', nick: 'MyNickTest', email: 'MyEmailTest@email.com', password: 'MyPasswordTest', birthday: Date.today-1, picture: 'MyPicturePathTest', isTermConditionsChecked: true)
      assert(user.email == 'myemailtest@email.com', 'User.create was expected to downcase email')
    end
  end
end
