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

#run rake task on the command line to test for now
#add httparty here
