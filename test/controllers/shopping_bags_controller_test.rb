require 'test_helper'

class ShoppingBagsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shopping_bags_show_url
    assert_response :success
  end

end
