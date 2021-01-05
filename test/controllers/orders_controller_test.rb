require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
 customers_controller

  test "should get index" do
    get orders_index_url
    assert_response :success
  end

  test "should get show" do
    get orders_show_url
    assert_response :success
  end

  test "should get update" do
    get orders_update_url
    assert_response :success
  end

 develop
end
