require 'csv'
#
# namespace :db do
#
#   desc "Import the Track info from CSV to track table"
#   task :tracks => :environment do
#     counter = 0
#     tracks_path = "#{Rails.root}/lib/assets/test_event.csv"
#     CSV.foreach(tracks_path, :headers => true, :header_converters => :symbol) do |row|
#       track = Track.create(
#       if row[:track].scan(/\d/) == []
#         row[:session] = "cross-session"
#       else
#         row[:session] = row[:track].scan(/\d/).join
#       end
#       )
#     end
#     counter += 1 if track.persisted?
#     puts "Imported #{counter} tracks"
#   end
# end

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
