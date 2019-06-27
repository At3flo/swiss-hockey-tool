require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get events_edit_url
    assert_response :success
  end

end
