class ActivityLogsController < ApplicationController

  def index
    @activity_logs = ActivityLog.all.order(start_time: :desc)
    @babies = Baby.all
    puts @babies.each { |baby| puts baby.id}
  end
end
