require "test_helper"

class Api::V1::TenantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_tenants_index_url
    assert_response :success
  end
end
