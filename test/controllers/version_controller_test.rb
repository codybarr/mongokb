require 'test_helper'

class VersionControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get revert" do
    get :revert
    assert_response :success
  end

end
