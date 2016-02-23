class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true
  validates :user_email, presence: true
  validates :start_time, presence: true
  validates :device_token, presence: true

  before_save :set_new_latest

  def set_new_latest
    email = self.user_email
    old_events = Event.where(user_email: email)
    old_events.update_all(:is_latest => false)
  end

end
