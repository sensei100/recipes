require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
   
  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com", password: "password")
    @recipe = @chef.recipes.build(name: "chicken parm", summary: "this is the best chicken parm recipe ever", description: "heat oil, add onions, add tomato sauce, add chicken, cook for 20 minutes.")
    @review = @chef.reviews.build(content: "This is an awesome recipe.  I absolutely LOVED it!!")
  end
  
  test "content should be present" do
    @review.content = " "
    assert_not @review.valid?
  end
  
  test "content length should not be too long" do
    @review.content = "a" * 501
    assert_not @review.valid?
  end
  
  test "content length should not be too short" do
    @review.content = "aaaa" 
    assert_not @review.valid?
  end
  
  test "chef_id should be present" do
    @review.chef_id = nil
    assert_not @review.valid?
  end
  
  test "recipe_id should be present" do
    @review.recipe_id = nil
    assert_not @review.valid?
  end
end