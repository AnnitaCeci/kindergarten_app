class ActivityLogsController < ApplicationController

  load_and_authorize_resource

  def index
    conditions = get_conditions
    if conditions
      @activity_logs = ActivityLog.where(conditions).order(start_time: :desc)
      else
    @activity_logs = ActivityLog.all.order(start_time: :desc)
    end
  end

  def show
    @activity_logs = ActivityLog.find_by(params[:id])
  end

  private

  def get_conditions
    conditions = {}
    if (params[:baby_id].present?)
      conditions[:baby_id] = params[:baby_id]
    end
    if (params[:assistant_id].present?)
      conditions[:assistant_id] = params[:assistant_id]
    end
    if (params[:status] == 'En Progreso')
      conditions[:stop_time] = [true, nil]
    end
    if (params[:status] == 'Terminada')
      conditions[:stop_time] = 'IS NOT NULL'
    end
    conditions
  end


end
