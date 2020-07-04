class ActivityLogSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :stop_time, :duration, :name, :comments, :baby_id, :assistant_id, :activity_id

  belongs_to :baby
  belongs_to :assistant
  belongs_to :activity
end
