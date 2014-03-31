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

end