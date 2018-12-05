require 'test_helper'

class InexControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get inex_welcome_url
    assert_response :success
  end

end
