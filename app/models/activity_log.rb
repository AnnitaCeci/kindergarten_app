# frozen_string_literal: true
class ActivityLog < ApplicationRecord
  validates :stop_time, presence: true, on: :update


  belongs_to :baby
  belongs_to :assistant
  belongs_to :activity

  before_update :calculate_duration

  private

  def calculate_duration
      self.duration = (stop_time - self.start_time).to_i / 60 if valid_dates?
  end

  def valid_dates?
    puts (stop_time.to_s > start_time).to_s
    stop_time > start_time
  end
end
