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

end