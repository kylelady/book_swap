require 'test_helper'

class ExportControllerTest < ActionController::TestCase
  test "should get csv" do
    get :csv
    assert_response :success
  end

end
