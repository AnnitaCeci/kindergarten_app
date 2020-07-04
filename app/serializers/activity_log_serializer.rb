class ActivityLogSerializer < ActiveModel::Serializer
  attributes :id, :baby_id, :teacher_name, :start_time, :stop_time

  def teacher_name
    self.object.assistant.name
  end
end
