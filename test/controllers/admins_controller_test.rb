require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get scaffold" do
    get admins_scaffold_url
    assert_response :success
  end

end
