require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "event holds a reference to the track id from the track table" do
    assert_equal 3, Event.last.track_id
    assert_equal "cross-session", Track.find(Event.last.track_id).session
  end
end
