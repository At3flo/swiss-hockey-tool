require 'test_helper'

class TeamsRegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get teams_registrations_create_url
    assert_response :success
  end

  test "should get delete" do
    get teams_registrations_delete_url
    assert_response :success
  end

end
