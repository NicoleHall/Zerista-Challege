require 'csv'
#
namespace :db do

  desc "Import the Track info from CSV to track table"
  task :tracks => :environment do
    tracks_path = File.path("#{Rails.root}/lib/assets/test_event.csv")
    csv = CSV.parse(tracks_path, :headers => true)

    csv.each do |row|
      start, finish, name, track = row
      Track.create!(session: row[:track])
    end
  end
end

namespace :db do

  desc "Import event info from the CSV to the event table"
  task :events => :environment do
    counter = 0
    csv_data = File.read("#{Rails.root}/lib/assets/test_event.csv")
    csv = CSV.parse(csv_data, :headers => true)

    csv.each do |row|
      event = Event.create!(row.to_hash)
      counter += 1 if event.persisted?
    end
    puts "imported #{counter} events"

  end

end
