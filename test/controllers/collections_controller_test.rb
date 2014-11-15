require 'test_helper'

class CollectionsControllerTest < ActionController::TestCase
  test "should get collection" do
    get :collection
    assert_response :success
  end

end
