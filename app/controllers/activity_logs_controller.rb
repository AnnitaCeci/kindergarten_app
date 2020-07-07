class ActivityLogsController < ApplicationController

  def index
    @activity_logs = ActivityLog.all.order(start_time: :desc)
    if (params[:baby_id].present? || params[:assistant_id].present?)
      @activity_logs = ActivityLog.where("baby_id = ? OR assistant_id = ? ", params[:baby_id], params[:assistant_id]).order(start_time: :desc)
    end
  end


end
