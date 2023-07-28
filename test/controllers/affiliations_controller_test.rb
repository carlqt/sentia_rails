require "test_helper"

class AffiliationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get affiliations_index_url
    assert_response :success
  end
end
