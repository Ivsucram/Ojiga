require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @category = categories(:one)
  end 

  # CRUD C
  test 'should create' do
  	assert_difference('Category.count') do
  		Category.create(name: @category.name)
  	end
  end

  # CRUD R
  test 'should retrieve' do
  	assert(Category.first == @category)
  	category = Category.create(name: 'NameTest')
  	assert(Category.last == category)
  end

  # CRUD U
  test 'should update' do
  	category = Category.create(name: 'CategoryNameOld')
  	assert(category.name == 'CategoryNameOld')
  	category.name = 'CategoryNameNew'
  	category.save
  	assert(!category.changed?)
  	assert(category.name == 'CategoryNameNew')
  end

  # CRUD D
  test 'should delete' do
  	assert_difference('Category.count', -1) do
  		Category.first.delete
  	end
  end

  test 'validates field name' do
  	# Validates presence
  	category = Category.new()
  	assert !category.save

  	# Validates length
  	category = Category.new(name: '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901')
  	assert !category.save

  	# Validates happy route
  	assert_difference('Category.count') do
  		Category.create(name: '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890')
  	end
  end
end