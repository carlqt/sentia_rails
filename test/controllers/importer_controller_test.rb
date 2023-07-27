require "test_helper"

class ImporterControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get importer_create_url
    assert_response :success
  end
end
