require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.create(username: "admin", email: "admin@a.com", password: "pwd", admin: true)
  end
  
  test "should get new category form and create category" do
    sign_in_as(@user, "pwd")
    get new_category_path
    assert_template 'categories/new'
    
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: {name: "sports"}
    end
    assert_template 'categories/index'
    assert_match "sports", response.body
  end  
  
  
  test "should fail when invalid category submission results" do
    sign_in_as(@user, "pwd")
    get new_category_path
    assert_template 'categories/new'
    
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: " "}
    end
    assert_template 'categories/new'
    assert_select "h2.panel-title"
    assert_select "div.panel-body"
    
  end
  
end
