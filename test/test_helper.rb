ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'capybara/rails'

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def setup
    create_three_track_objects
    create_three_event_objects
    add_track_ids_to_event_objects
  end

  def create_three_track_objects
    Track.create(session: "1")
    Track.create(session: "2")
    Track.create(session: "cross-session")
  end

  def create_three_event_objects
    Event.create(
      start: "12/8/2015 8:00",
      finish: "12/8/2015 9:50",
      name: "T3P4OR3 Segmentation and Registration",
      track: "Track 1 - Pattern Recognition"
    )

    Event.create(
      start: "12/8/2015 8:00",
      finish: "12/8/2015 8:45",
      name: "Image Computing for Digital Pathology",
      track: "Track 2 - Image, Speech, and Signal Processing"
    )

    Event.create(
      start: "12/8/2015 7:00",
      finish: "12/8/2015 7:45",
      name: "Monday Plenary Session 1",
      track: "Keynote"
    )

    def add_track_ids_to_event_objects
      Event.first.update(track_id: 1)
      Event.second.update(track_id: 2)
      Event.last.update(track_id: 3)
    end
  end

end
