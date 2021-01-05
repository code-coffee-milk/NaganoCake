require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
 customers_controller

  test "should get top" do
    get homes_top_url
    assert_response :success
  end

 develop
end
