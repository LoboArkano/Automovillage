require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get votes_new_url
    assert_response :success
  end

  test "should get create" do
    get votes_create_url
    assert_response :success
  end

end
