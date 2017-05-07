require 'test_helper'

class EventsAtendeesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get events_atendees_create_url
    assert_response :success
  end

end
