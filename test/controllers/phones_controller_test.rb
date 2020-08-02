require 'test_helper'

class PhonesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get phones_show_url
    assert_response :success
  end

end
