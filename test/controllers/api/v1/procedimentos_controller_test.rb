require "test_helper"

class Api::V1::ProcedimentosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_procedimentos_index_url
    assert_response :success
  end
end
