class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true
  validates :user_email, presence: true
  validates :start_time, presence: true
  validates :device_token, presence: true

  before_save :set_new_latest

  def set_new_latest
    prev_notified = Event.where(user_email: email, google_event_id: self.google_event_id).where(has_notified: true).exists?
    if prev_notified
      errors.add(:base, 'Event already_notified')
    else
      email = self.user_email
      old_events = Event.where(user_email: email, google_event_id: self.google_event_id)
      old_events.update_all(:is_latest => false)
    end
  end

  def dont_notify_if_stale
  end

end
