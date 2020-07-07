class ActivityLog < ApplicationRecord

  validates :activity_id, presence: true, on: :create
  validates :assistant_id, presence: true, on: :create
  validates :baby_id, presence: true, on: :create
  validates :start_time, presence: true, on: :create
  validates :stop_time, presence: true, on: :update

  validates_datetime :stop_time, :on => :update, on_or_after: lambda { :start_time }
  validates_datetime :start_time, :on => :create, on_or_after: lambda { Time.now() }


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
