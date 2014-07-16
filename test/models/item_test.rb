require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@user = users(:good_one)
  	@category = categories(:one)
  	@item = Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
  end

  # CRUD C
  test 'should create' do
  	assert_difference('Item.count') do
  		Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
  	end
  end

  # CRUD R
  test 'should retrieve' do
  	assert(Item.first == @item)
  	item = Item.create(user: @user, category: @category, name: 'ItemName2', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
  	assert(Item.last == item)
  end

  # CRUD U
  test 'should update' do
  	item = Item.create(user: @user, category: @category, name: 'ItemNameOld', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
  	assert(item.name == 'ItemNameOld')
  	item.name = 'ItemNameNew'
  	item.save
  	assert(!item.changed?, 'item was not saved')
  	assert(item.name == 'ItemNameNew')
  end

  # CRUD D
  test 'should delete' do
  	assert_difference('Item.count', -1) do
  		Item.first.delete
  	end
  end

  test 'validates user' do
    # Validates presence
    item = Item.create(category: @category, name: 'ItemName2', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    assert !item.save
  end

  test 'validates category' do
    item = Item.create(user: @user, name: 'ItemName2', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    assert !item.save
  end

  test 'validates name' do
    # Validates presence
    item = Item.create(user: @user, category: @category, picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    assert !item.save

    # Validates length
    item = Item.create(user: @user, category: @category, name: '01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    assert !item.save

    # Validates happy route
    assert_difference('Item.count') do
      Item.create(user: @user, category: @category, name: '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    end
  end

  test 'validates picture' do
    # Validates presence
    item = Item.create(user: @user, category: @category, name: '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    assert !item.save
  end

  test 'validates description' do
    # Validates presence
    item = Item.create(user: @user, category: @category, name: '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789', picture: 'ItemPathForFolderWithPictures', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    assert !item.save
  end

  test 'validates rentUnitPrice' do
    # Validates presence
    item = Item.create(user: @user, category: @category, name: '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    assert !item.save

    # Validates lessThanZero
    item = Item.create(user: @user, category: @category, name: '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: -1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    assert !item.save

    # Validates EqualZero
    item = Item.create(user: @user, category: @category, name: '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 0, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    assert !item.save
  end

  test 'valdiates unitTime' do
    # Validates presence false
    item = Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    assert !item.save
  end

  test 'validates minimumRentingTime' do
    # Validates presence
    assert_difference('Item.count') do
      Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    end
    assert_difference('Item.count') do
      Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    end
  end

  test 'validates maximumRentingTime' do
    assert_difference('Item.count') do
      Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    end
    assert_difference('Item.count') do
      Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), totalValue: 250, isAvailable: true)
    end
  end

  test 'validates totalValue' do
    # Validates presence
    item = Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), isAvailable: true)
    assert !item.save

    # Validates lessThanZero
    item = Item.create(user: @user, category: @category, name: '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: -1.0, isAvailable: true)
    assert !item.save

    # Validates EqualZero
    item = Item.create(user: @user, category: @category, name: '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 0.0, isAvailable: true)
    assert !item.save
  end

#TODO validates field isAvailable

  test 'validates rentUnit_between_minimumRentingTime_and_maximumRentingTime' do
    day = 24*60*60
    #Validate rentUnit less than minimumRentingTime
    item = Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(day), minimumRentingTime: Time.at(2*day), maximumRentingTime: Time.at(7*day), totalValue: 250, isAvailable: true)
    assert !item.save
    item = Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(2*day-1), minimumRentingTime: Time.at(2*day), maximumRentingTime: Time.at(7*day), totalValue: 250, isAvailable: true)
    assert !item.save

    #Validate rentUnit greater than maximumRentingTime
    item = Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(8*day), minimumRentingTime: Time.at(2*day), maximumRentingTime: Time.at(7*day), totalValue: 250, isAvailable: true)
    assert !item.save
    item = Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(8*day+1), minimumRentingTime: Time.at(2*day), maximumRentingTime: Time.at(7*day), totalValue: 250, isAvailable: true)
    assert !item.save

    #Validate rentUnit equal minimumRentingTime
    assert_difference('Item.count') do
      item = Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(2*day), minimumRentingTime: Time.at(2*day), maximumRentingTime: Time.at(7*day), totalValue: 250, isAvailable: true)
    end

    #Validate rentUnit equal maximumRentingTime
    assert_difference('Item.count') do
      item = Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(7*day), minimumRentingTime: Time.at(2*day), maximumRentingTime: Time.at(7*day), totalValue: 250, isAvailable: true)
    end

    #Validate rentUnit between minimumRentinTime and maximumRentingTime
    assert_difference('Item.count') do
      item = Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(4*day), minimumRentingTime: Time.at(2*day), maximumRentingTime: Time.at(7*day), totalValue: 250, isAvailable: true)
    end
  end

  test 'validates minimumRentingTime_LessOrEqual_maximumRentingTime' do
    day = 24*60*60
    #Validate minimumRentingTime greater than maximumRentingTime
    item = Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(3*day), minimumRentingTime: Time.at(2*day), maximumRentingTime: Time.at(1*day), totalValue: 250, isAvailable: true)
    assert !item.save

    #Validate minimumRentingTime equal maximumRentingTime
    assert_difference('Item.count') do
      Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(day), minimumRentingTime: Time.at(day), maximumRentingTime: Time.at(day), totalValue: 250, isAvailable: true)
    end

    #Validate minimumRentingTime less than maximumRentingTime
    assert_difference('Item.count') do
      Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 1, unitTime: Time.at(day), minimumRentingTime: Time.at(day-1), maximumRentingTime: Time.at(day), totalValue: 250, isAvailable: true)
    end
  end

  test 'validates rentUnitPrice_LessOrEqual_totalValue' do
    #Validate rentUnitPrice greater than totalValue
    item = Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 250.01, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    assert !item.save

    #Validate rentUnitPrice equal totalValue
    assert_difference('Item.count') do
      Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 250, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    end

    #Validate rentUnitPrice less than totalValue
    assert_difference('Item.count') do
      Item.create(user: @user, category: @category, name: 'ItemName', picture: 'ItemPathForFolderWithPictures', description: 'ItemDescription', rentUnitPrice: 249.99, unitTime: Time.at(60*60*24), minimumRentingTime: Time.at(60*60*24), maximumRentingTime: Time.at(7*60*60*24), totalValue: 250, isAvailable: true)
    end
  end

end