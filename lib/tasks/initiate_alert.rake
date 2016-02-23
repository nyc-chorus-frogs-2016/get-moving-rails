APNS.pem  = File.join(Rails.root, 'config', 'cert.pem')

task :find_upcoming => :environment do
  if Event.where("departure_time < ? AND has_notified = ? AND is_latest = ? AND start_time > ?", Time.now + 600, false, true, Time.now).empty?
    puts "You have no events in the next 10 minutes, go relax for a bit"
  else
    events_to_alert = Event.where("departure_time < ? AND has_notified = ? AND is_latest = ? AND start_time > ?", Time.now + 600, false, true, Time.now).each do |event|
      puts "You need to leave for #{event.name} in " + ((event.departure_time - Time.now)/60).to_s + " minutes, Get Moving!"
      puts "Send a push notification for '#{event.name}' to Apple."

      APNS.send_notification(event.device_token, alert:"You need to leave for #{event.name} in the next 10 minutes!", badge: 1, sound: 'default')
      event.update_attributes(has_notified: true)
    end
  end
end

task :calculate_directions => :environment do
  Event.all.each do |event|
    url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=" + event.user_lat.to_s + "," + event.user_lng.to_s + "&destinations=" + event.event_lat.to_s + "," + event.event_lng.to_s + "&key=AIzaSyAz4HXhCsn9tZdJ24R3lCMZ2kFakiabDgw"

    response = HTTParty.get(url)

    seconds_to_destination = response["rows"][0]["elements"][0]["duration"]["value"]
    new_departure_time = event.start_time - seconds_to_destination
    event.update_attributes(departure_time: new_departure_time)
  end
end

task :scheduled_jobs => [:calculate_directions, :find_upcoming] do
  puts 'Running shceduled tasks'
end
