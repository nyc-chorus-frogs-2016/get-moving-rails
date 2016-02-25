APNS.pem  = File.join(Rails.root, 'config', 'cert.pem')

task :find_upcoming => :environment do
  key = ENV["GOOGLE_MAPS_KEY"]
  events =  Event.where("has_notified = ? AND is_latest = ? AND start_time > ?", false, true, Time.now)
  events.each do |event|
    url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=" + event.user_lat.to_s + "," + event.user_lng.to_s + "&destinations=" + event.event_lat.to_s + "," + event.event_lng.to_s + "&key=#{key}"

    response = HTTParty.get(url)
    puts response.body
    # puts "Original Event: " event

    seconds_to_destination = response["rows"][0]["elements"][0]["duration"]["value"]
    new_departure_time = event.start_time - seconds_to_destination
    event.update_columns(departure_time: new_departure_time)

    puts "Seconds to destination: "
    puts seconds_to_destination
    puts "Minutes to destination: "
    puts (seconds_to_destination/60).to_s
    puts "New departure time: "
    puts new_departure_time
    puts "Newly updated event departure time: "
    puts event.departure_time

  end

  if Event.where("departure_time < ? AND has_notified = ? AND is_latest = ? AND start_time > ?", Time.now + 600, false, true, Time.now).empty?
    puts "You have no events in the next 10 minutes, go relax for a bit"
  else
    events_to_alert = Event.where("departure_time < ? AND has_notified = ? AND is_latest = ? AND start_time > ?", Time.now + 600, false, true, Time.now)
    events_to_alert.each do |event|
      puts "You need to leave for #{event.name} in " + ((event.departure_time - Time.now)/60).to_s + " minutes, Get Moving!"
      puts "Send a push notification for '#{event.name}' to Apple."

      APNS.send_notification(event.device_token, alert:"You need to leave for #{event.name} in the next 10 minutes!", badge: 1, sound: 'default')
      event.update_attributes(has_notified: true)
    end
  end
end

# bundle exec rake scheduled_jobs

# be cap deploy

# rng2@scdr:~/apps/get-moving-rails/current/lib/tasks$  /home/rng2/run_scheduled_jobs.sh

# rng2@scdr:~/apps/get-moving-rails/current/lib/tasks$ rails c

# rng2@scdr:~/apps/get-moving-rails/current$ bundle exec rake find_upcoming

# to run the task now on the server: enter what is after the $:
# rng2@scdr:~$  ./run_scheduled_jobs.sh
