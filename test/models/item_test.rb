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
end