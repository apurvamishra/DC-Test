require 'test_helper'

class UploadControllerTest < ActionController::TestCase
  test "should get uploadfile" do
    get :uploadfile
    assert_response :success
  end

end
