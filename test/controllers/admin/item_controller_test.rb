require 'test_helper'

class Admin::ItemControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_item_new_url
    assert_response :success
  end

end
